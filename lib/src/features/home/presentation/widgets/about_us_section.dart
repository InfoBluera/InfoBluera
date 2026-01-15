import 'package:code_line/src/common_widgets/glass_container.dart';
import 'package:code_line/src/common_widgets/responsive_wrapper.dart';
import 'package:code_line/src/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWrapper.isMobile(context);
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: ResponsiveWrapper(
        child: Column(
          children: [
            Text(
              'Who We Are',
              style: AppTextStyle.caption.copyWith(
                color: AppColours.accent,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ).animate().fadeIn().slideY(begin: 0.1),
            const SizedBox(height: 8),
            Text(
              'About Us',
              style: isMobile?AppTextStyle.h2.copyWith(fontSize: 32):AppTextStyle.h2,
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1),
            const SizedBox(height: 48),
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 800;

                return isMobile ? _buildMobileLayout(context) : _buildDesktopLayout(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildContentCard(context),
        const SizedBox(height: 32),
        _buildValues(), // Replaced stats with values
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 3, child: _buildContentCard(context)),
          const SizedBox(width: 48), // Increased spacing
          Expanded(
            flex: 2,
            child: _buildValues(),
          ), // Replaced stats with values
        ],
      ),
    );
  }

  Widget _buildContentCard(BuildContext context) {
    final isMobile = ResponsiveWrapper.isMobile(context);
    return GlassContainer(
      padding: const EdgeInsets.all(40), // Increased padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Innovating for the Future',
            style: isMobile?AppTextStyle.h3.copyWith(fontSize: 24):AppTextStyle.h3.copyWith(fontSize: 28),
          ),
          const SizedBox(height: 24),
          Text(
            'We are a passionate and experienced software development team dedicated to building scalable, secure, and high-performance digital products.',
            style: isMobile?AppTextStyle.bodyLarge.copyWith(height: 1.8,fontSize: 16):AppTextStyle.bodyLarge.copyWith(height: 1.8),
          ),
          const SizedBox(height: 24),
          Text(
            'From startup MVPs to enterprise-level platforms, we partner with businesses to transform ideas into reliable, user-friendly technology solutions that drive real growth.',
            style: isMobile?AppTextStyle.body.copyWith(height: 1.8,fontSize: 14):AppTextStyle.body.copyWith(height: 1.8),
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1);
  }

  Widget _buildValues() {
    // New implementation for Core Values
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildValueItem(
          icon: Icons.rocket_launch,
          title: 'High Performance',
          subtitle: 'Optimized for speed and efficiency.',
          delay: 300,
        ),
        const SizedBox(height: 16),
        _buildValueItem(
          icon: Icons.security,
          title: 'Secure & Reliable',
          subtitle: 'Bank-grade security standards.',
          delay: 400,
        ),
        const SizedBox(height: 16),
        _buildValueItem(
          icon: Icons.layers,
          title: 'Scalable Architecture',
          subtitle: 'Built to grow with your business.',
          delay: 500,
        ),
      ],
    );
  }

  Widget _buildValueItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required int delay,
  }) {

    return GlassContainer(
      padding: const EdgeInsets.all(24),
      color: AppColours.primary.withValues(alpha: 0.05),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColours.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColours.primaryLight, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColours.textPrimary,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyle.caption.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: delay.ms).slideX(begin: 0.1);
  }
}
