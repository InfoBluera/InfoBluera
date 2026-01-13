import 'package:flutter/material.dart';
import 'package:code_line/src/constants/app_constants.dart';
import 'package:code_line/src/common_widgets/responsive_wrapper.dart';
import 'package:code_line/src/common_widgets/glass_container.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent, // Background handled by main scaffold/gradient
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      child: ResponsiveWrapper(
        child: Column(
          children: [
            Text(
              'Our Expertise',
              style: AppTextStyle.caption.copyWith(
                color: AppColours.accent,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Comprehensive IT Solutions',
              style: AppTextStyle.h2,
              textAlign: TextAlign.center,
            ).animate().fadeIn().slideY(begin: 0.1),
            const SizedBox(height: 16),
            SizedBox(
              width: 600,
              child: Text(
                'We deliver end-to-end digital services, moving from concept to deployment with precision and speed.',
                style: AppTextStyle.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ).animate().fadeIn(delay: 100.ms),
            const SizedBox(height: 80),
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 700;
                final isTablet = constraints.maxWidth < 1100 && !isMobile;

                return Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: [
                    _ServiceCard(
                      icon: Icons.web,
                      title: 'Web Platforms',
                      description:
                          'High-performance web applications built with Flutter, React, and Next.js.',
                      width: _cardWidth(
                        constraints.maxWidth,
                        isMobile,
                        isTablet,
                      ),
                      delay: 0,
                    ),
                    _ServiceCard(
                      icon: Icons.smartphone,
                      title: 'Mobile Ecosystems',
                      description:
                          'Native-feel iOS and Android apps with unified codebases and smooth animations.',
                      width: _cardWidth(
                        constraints.maxWidth,
                        isMobile,
                        isTablet,
                      ),
                      delay: 100,
                    ),
                    _ServiceCard(
                      icon: Icons.cloud_done,
                      title: 'Cloud Infrastructure',
                      description:
                          'Scalable microservices on AWS/Google Cloud designed for 99.9% uptime.',
                      width: _cardWidth(
                        constraints.maxWidth,
                        isMobile,
                        isTablet,
                      ),
                      delay: 200,
                    ),
                    _ServiceCard(
                      icon: Icons.design_services,
                      title: 'UI/UX Design',
                      description:
                          'Award-winning interfaces that prioritize user retention and brand identity.',
                      width: _cardWidth(
                        constraints.maxWidth,
                        isMobile,
                        isTablet,
                      ),
                      delay: 300,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  double _cardWidth(double maxWidth, bool isMobile, bool isTablet) {
    if (isMobile) return maxWidth;
    if (isTablet) return (maxWidth - 24) / 2;
    return (maxWidth - 48) / 3; // 3 columns on desktop
  }
}

class _ServiceCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String description;
  final double width;
  final int delay;

  const _ServiceCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.width,
    this.delay = 0,
  }) : super(key: key);

  @override
  State<_ServiceCard> createState() => _ServiceCardState();
}

class _ServiceCardState extends State<_ServiceCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCubic,
        width: widget.width,
        transform: _isHovered
            ? Matrix4.translationValues(0, -10, 0)
            : Matrix4.identity(),
        child: GlassContainer(
          color: _isHovered ? AppColours.primary.withValues(alpha: 0.1) : null,
          opacity: _isHovered ? 0.2 : 0.05,
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: _isHovered
                          ? AppColours.primary
                          : AppColours.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      widget.icon,
                      color: _isHovered ? Colors.white : AppColours.primary,
                      size: 32,
                    ),
                  )
                  .animate(target: _isHovered ? 1 : 0)
                  .scale(end: const Offset(1.1, 1.1)),
              const SizedBox(height: 24),
              Text(widget.title, style: AppTextStyle.h4),
              const SizedBox(height: 12),
              Text(
                widget.description,
                style: AppTextStyle.body.copyWith(
                  color: AppColours.textSecondary,
                ),
              ),
              const SizedBox(height: 24),
              AnimatedOpacity(
                opacity: _isHovered ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 200),
                child: Row(
                  children: [
                    Text(
                      'Learn More',
                      style: AppTextStyle.button.copyWith(
                        color: AppColours.primaryLight,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.arrow_forward,
                      size: 16,
                      color: AppColours.primaryLight,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ).animate().fadeIn(delay: widget.delay.ms).slideY(begin: 0.1),
    );
  }
}
