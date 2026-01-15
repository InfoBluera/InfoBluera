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
                          const SizedBox(height: 60),
                          _buildEnquiryForm(),
                        ],
                      )
                    : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 4, child: _buildContactInfo()),
                          const SizedBox(width: 80),
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: const EdgeInsets.all(32),
                              decoration: BoxDecoration(
                                color: Colors.white.withValues(alpha: 0.03),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.white.withValues(alpha: 0.05),
                                ),
                              ),
                              child: _buildEnquiryForm(),
                            ),
                          ),
                        ],
                      );
              },
            ),
            const SizedBox(height: 80),
            const Divider(color: Colors.white12),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '© 2026 Codeline. All rights reserved.',
                  style: AppTextStyle.caption.copyWith(
                    color: AppColours.textTertiary,
                  ),
                ),
                // Optional Social Icons or Links could go here
              ],
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
            Icon(Icons.code, color: AppColours.primary, size: 40),
            const SizedBox(width: 12),
            Text('Codeline', style: AppTextStyle.h2),
          ],
        ),
        const SizedBox(height: 24),
        Text(
          'Empowering businesses with cutting-edge digital solutions. We build scalable, high-performance applications tailored to your needs.',
          style: AppTextStyle.body.copyWith(
            color: AppColours.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 48),
        _ContactItem(
          icon: Icons.location_on,
          title: 'Headquarters',
          content: 'Kerala, India',
        ),
        const SizedBox(height: 24),
        _ContactItem(
          icon: Icons.email,
          title: 'Email Us',
          content: 'codelinehelpdesk@gmail.com',
          onTap: () => _launchUrl('mailto:codelinehelpdesk@gmail.com'),
        ),
        const SizedBox(height: 24),
        _ContactItem(
          icon: Icons.phone,
          title: 'Call Us',
          content: '+91 98478 65571',
          onTap: () => _launchUrl('tel:+919847865571'),
        ),
        const SizedBox(height: 24),
        _ContactItem(
          icon: Icons.chat,
          title: 'WhatsApp',
          content: '+91 81299 48257',
          onTap: () => _launchUrl('https://wa.me/918129948257'),
        ),
      ],
    ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1);
  }

  // _buildBusinessInfo removed

  Widget _buildEnquiryForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Ready to Start?', style: AppTextStyle.h3),
        const SizedBox(height: 8),
        Text(
          'Send us a message and we\'ll get back to you shortly.',
          style: AppTextStyle.body.copyWith(color: AppColours.textTertiary),
        ),
        const SizedBox(height: 32),
        _EnquiryField(hintText: 'Your Name', icon: Icons.person),
        const SizedBox(height: 16),
        _EnquiryField(hintText: 'Email / Phone', icon: Icons.contact_mail),
        const SizedBox(height: 16),
        _EnquiryField(
          hintText: 'Tell us about your project',
          icon: Icons.message,
          maxLines: 4,
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // TODO: Implement send logic
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColours.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 4,
              shadowColor: AppColours.primary.withValues(alpha: 0.4),
            ),
            child: Text(
              'Send Enquiry',
              style: AppTextStyle.button.copyWith(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1);
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
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColours.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColours.primaryLight, size: 22),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyle.caption.copyWith(
                  color: AppColours.textTertiary,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                content,
                style: AppTextStyle.body.copyWith(
                  color: onTap != null
                      ? Colors
                            .white // Brighter for contact details
                      : Colors.white70,
                  fontWeight: onTap != null ? FontWeight.w500 : FontWeight.w400,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// _InfoBlock removed

class _EnquiryField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final int maxLines;

  const _EnquiryField({
    required this.hintText,
    required this.icon,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.4)),
        prefixIcon: Icon(
          icon,
          color: AppColours.primary.withValues(alpha: 0.7),
          size: 20,
        ),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.05),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            color: AppColours.primary.withValues(alpha: 0.5),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
      ),
    );
  }
}
