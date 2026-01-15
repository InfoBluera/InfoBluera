import 'package:code_line/src/common_widgets/responsive_wrapper.dart';
import 'package:code_line/src/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColours.secondary,
      padding: const EdgeInsets.only(top: 80, bottom: 20, left: 24, right: 24),
      child: ResponsiveWrapper(
        child: Column(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 900;
                return isMobile
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildContactInfo(),
                          const SizedBox(height: 48),
                          _buildBusinessInfo(),
                          const SizedBox(height: 48),
                          _buildQuickLinks(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 3, child: _buildContactInfo()),
                          const SizedBox(width: 48),
                          Expanded(flex: 3, child: _buildBusinessInfo()),
                          const SizedBox(width: 48),
                          Expanded(flex: 2, child: _buildQuickLinks()),
                        ],
                      );
              },
            ),
            const SizedBox(height: 60),
            const Divider(color: Colors.white12),
            const SizedBox(height: 20),
            Text(
              '© 2026 Codeline. All rights reserved.',
              style: AppTextStyle.caption,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(Icons.code, color: AppColours.primary, size: 32),
            const SizedBox(width: 8),
            Text('Codeline', style: AppTextStyle.h3),
          ],
        ),
        const SizedBox(height: 32),
        _ContactItem(
          icon: Icons.location_on,
          title: 'Location',
          content: 'Kerala, India',
        ),
        const SizedBox(height: 24),
        _ContactItem(
          icon: Icons.email,
          title: 'Email',
          content: 'codelinehelpdesk@gmail.com',
          onTap: () => _launchUrl('mailto:codelinehelpdesk@gmail.com'),
        ),
        const SizedBox(height: 24),
        _ContactItem(
          icon: Icons.phone,
          title: 'Phone',
          content: '+91 98478 65571',
          onTap: () => _launchUrl('tel:+919847865571'),
        ),
        const SizedBox(height: 24),
        _ContactItem(
          icon: Icons.chat,
          title: 'WhatsApp Support',
          content: '+91 81299 48257',
          onTap: () => _launchUrl('https://wa.me/918129948257'),
        ),
      ],
    ).animate().fadeIn(delay: 100.ms).slideX(begin: -0.1);
  }

  Widget _buildBusinessInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Service & Support', style: AppTextStyle.h4),
        const SizedBox(height: 32),
        _InfoBlock(
          title: '🌐 Service Area',
          content: 'Serving clients across India and internationally.',
        ),
        const SizedBox(height: 24),
        _InfoBlock(
          title: '🤝 Project Enquiries',
          content:
              'For new projects, collaborations, or consultations, feel free to reach out via email or WhatsApp.',
        ),
        const SizedBox(height: 24),
        _InfoBlock(
          title: '📩 Support & Assistance',
          content:
              'We provide ongoing support, maintenance, and technical assistance for all our solutions.',
        ),
      ],
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1);
  }

  Widget _buildQuickLinks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Quick Links', style: AppTextStyle.h4),
        const SizedBox(height: 32),
        _FooterLink('Home'),
        _FooterLink('About'),
        _FooterLink('Services'),
        _FooterLink('Portfolio'),
        _FooterLink('Contact'),
      ],
    ).animate().fadeIn(delay: 300.ms).slideX(begin: 0.1);
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final VoidCallback? onTap;

  const _ContactItem({
    required this.icon,
    required this.title,
    required this.content,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColours.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppColours.primaryLight, size: 20),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.caption.copyWith(
                  color: AppColours.textTertiary,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                content,
                style: AppTextStyle.body.copyWith(
                  color: onTap != null
                      ? AppColours.textPrimary
                      : AppColours.textSecondary,
                  fontWeight: onTap != null ? FontWeight.w600 : FontWeight.w400,
                  decoration: onTap != null ? TextDecoration.underline : null,
                  decorationColor: AppColours.textPrimary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoBlock extends StatelessWidget {
  final String title;
  final String content;

  const _InfoBlock({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyle.bodyLarge.copyWith(
            fontWeight: FontWeight.bold,
            color: AppColours.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Text(content, style: AppTextStyle.body),
      ],
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String text;
  const _FooterLink(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Text(
        text,
        style: AppTextStyle.body.copyWith(
          color: AppColours.textSecondary,
          fontSize: 16,
        ),
      ),
    );
  }
}
