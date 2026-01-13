import 'package:flutter/material.dart';
import 'package:code_line/src/constants/app_constants.dart';
import 'package:code_line/src/common_widgets/responsive_wrapper.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColours.secondary,
      padding: const EdgeInsets.only(top: 60, bottom: 20, left: 24, right: 24),
      child: ResponsiveWrapper(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.code, color: AppColours.primary, size: 28),
                        const SizedBox(width: 8),
                        Text('Codeline', style: AppTextStyle.h4),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Innovating for the future.',
                      style: AppTextStyle.body.copyWith(
                        color: AppColours.textSecondary,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Links',
                      style: AppTextStyle.h4.copyWith(fontSize: 18),
                    ),
                    const SizedBox(height: 16),
                    _FooterLink('Home'),
                    _FooterLink('About'),
                    _FooterLink('Services'),
                    _FooterLink('Contact'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 40),
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
}

class _FooterLink extends StatelessWidget {
  final String text;
  const _FooterLink(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: AppTextStyle.body.copyWith(
          color: AppColours.textSecondary,
          fontSize: 14,
        ),
      ),
    );
  }
}
