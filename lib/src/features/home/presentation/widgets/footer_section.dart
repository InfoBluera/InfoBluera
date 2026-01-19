import 'dart:developer';
import 'dart:ui';

import 'package:code_line/src/common_widgets/glass_container.dart';
import 'package:code_line/src/common_widgets/gradient_button.dart';
import 'package:code_line/src/common_widgets/responsive_wrapper.dart';
import 'package:code_line/src/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class FooterSection extends StatefulWidget {
  const FooterSection({super.key});

  @override
  State<FooterSection> createState() => _FooterSectionState();
}

class _FooterSectionState extends State<FooterSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isLoading = false;

  Future<void> _submitForm() async {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _messageController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please fill all fields')));
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final url = Uri.parse(
        'https://docs.google.com/forms/u/0/d/e/1FAIpQLSeDX1jbHc21dhRyY6zLpIwhfqaMUACd89RiQSYyPARlYk1bAw/formResponse',
      );

      await http.post(
        url,
        body: {
          'entry.2129506232': _nameController.text, // Name
          'entry.1366067459': _emailController.text, // Email/Phone
          'entry.2139908626': _messageController.text, // Message
        },
      );

      _nameController.clear();
      _emailController.clear();
      _messageController.clear();

      if (mounted) {
        showDialog(
          context: context,
          builder: (context) => const _SuccessDialog(),
        );
      }
    } catch (e) {
      // Check for CORS error on Web (which implies success for Google Forms)
      if (e.toString().contains('Failed to fetch')) {
        _nameController.clear();
        _emailController.clear();
        _messageController.clear();

        if (mounted) {
          showDialog(
            context: context,
            builder: (context) => const _SuccessDialog(),
          );
        }
        return;
      }

      if (mounted) {
        log(e.toString());
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error sending message: $e')));
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColours.secondary,
      child: Stack(
        children: [
          // Background Gradient Element
          Positioned(
            top: -100,
            right: -100,
            child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
              child: Container(
                width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColours.primary.withValues(alpha: 0.05),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(
              top: 100,
              bottom: 40,
              left: 24,
              right: 24,
            ),
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
                                _buildEnquiryForm(context),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(flex: 4, child: _buildContactInfo()),
                                const SizedBox(width: 80),
                                Expanded(
                                  flex: 5,
                                  child: _buildEnquiryForm(context),
                                ),
                              ],
                            );
                    },
                  ),
                  const SizedBox(height: 80),
                  Divider(color: Colors.white.withValues(alpha: 0.1)),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(
                        '© 2026 Codeline. All rights reserved.',
                        style: AppTextStyle.caption.copyWith(
                          color: AppColours.textTertiary,
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _SocialIcon(
                            icon: FontAwesomeIcons.linkedin,
                            url: 'https://linkedin.com',
                          ),
                          const SizedBox(width: 16),
                          _SocialIcon(
                            icon: FontAwesomeIcons.twitter,
                            url: 'https://twitter.com',
                          ),
                          const SizedBox(width: 16),
                          _SocialIcon(
                            icon: FontAwesomeIcons.instagram,
                            url: 'https://instagram.com',
                          ),
                          const SizedBox(width: 16),
                          _SocialIcon(
                            icon: FontAwesomeIcons.github,
                            url: 'https://github.com',
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColours.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.code, color: AppColours.primary, size: 32),
            ),
            const SizedBox(width: 16),
            Text('Codeline', style: AppTextStyle.h2.copyWith(fontSize: 32)),
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
          icon: Icons.location_on_outlined,
          title: 'Headquarters',
          content: 'Kerala, India',
        ),
        const SizedBox(height: 24),
        _ContactItem(
          icon: Icons.email_outlined,
          title: 'Email Us',
          content: 'codelinehelpdesk@gmail.com',
          onTap: () => _launchUrl('mailto:codelinehelpdesk@gmail.com'),
        ),
        const SizedBox(height: 24),
        _ContactItem(
          icon: Icons.phone_outlined,
          title: 'Call Us',
          content: '+91 98478 65571',
          onTap: () => _launchUrl('tel:+919847865571'),
        ),
        const SizedBox(height: 24),
        _ContactItem(
          icon: FontAwesomeIcons.whatsapp,
          title: 'WhatsApp',
          content: '+91 81299 48257',
          onTap: () => _launchUrl('https://wa.me/918129948257'),
        ),
      ],
    ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1);
  }

  Widget _buildEnquiryForm(BuildContext context) {
    return GlassContainer(
      opacity: 0.05,
      blur: 20,
      borderRadius: BorderRadius.circular(24),
      padding: const EdgeInsets.all(32),
      border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Ready to Start?', style: AppTextStyle.h3),
          const SizedBox(height: 8),
          Text(
            'Send us a message and we\'ll get back to you shortly.',
            style: AppTextStyle.body.copyWith(color: AppColours.textTertiary),
          ),
          const SizedBox(height: 32),
          _EnquiryField(
            controller: _nameController,
            hintText: 'Your Name',
            icon: Icons.person_outline,
          ),
          const SizedBox(height: 16),
          _EnquiryField(
            controller: _emailController,
            hintText: 'Email / Phone',
            icon: Icons.mail_outline,
          ),
          const SizedBox(height: 16),
          _EnquiryField(
            controller: _messageController,
            hintText: 'Tell us about your project',
            icon: Icons.message_outlined,
            maxLines: 4,
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: GradientButton(
              text: _isLoading ? 'Sending...' : 'Send Enquiry',
              onPressed: _isLoading ? () {} : _submitForm,
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1);
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}

class _SuccessDialog extends StatelessWidget {
  const _SuccessDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: GlassContainer(
        opacity: 0.1,
        blur: 20,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColours.primary.withValues(alpha: 0.2)),
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColours.primary.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_rounded,
                color: AppColours.primary,
                size: 48,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'Enquiry Sent!',
              style: AppTextStyle.h3,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),
            Text(
              'Thank you for reaching out. We will get back to you shortly.',
              style: AppTextStyle.body.copyWith(
                color: AppColours.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: GradientButton(
                text: 'Close',
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
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
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColours.primary.withValues(alpha: 0.2),
                    AppColours.primary.withValues(alpha: 0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColours.primary.withValues(alpha: 0.2),
                ),
              ),
              child: Icon(icon, color: AppColours.primaryLight, size: 20),
            ),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.caption.copyWith(
                    color: AppColours.textTertiary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: AppTextStyle.body.copyWith(
                    color: onTap != null ? Colors.white : Colors.white70,
                    fontWeight: onTap != null
                        ? FontWeight.w600
                        : FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialIcon extends StatelessWidget {
  final IconData icon;
  final String url;

  const _SocialIcon({required this.icon, required this.url});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) await launchUrl(uri);
      },
      borderRadius: BorderRadius.circular(50),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
          color: Colors.white.withValues(alpha: 0.05),
        ),
        child: Icon(icon, size: 18, color: AppColours.textSecondary),
      ),
    );
  }
}

class _EnquiryField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final int maxLines;
  final TextEditingController? controller;

  const _EnquiryField({
    required this.hintText,
    required this.icon,
    this.maxLines = 1,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white.withValues(alpha: 0.4)),
        prefixIcon: Icon(icon, color: AppColours.textTertiary, size: 20),
        filled: true,
        fillColor: Colors.black.withValues(alpha: 0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.05)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: AppColours.primary.withValues(alpha: 0.5),
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }
}
