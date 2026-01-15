import 'package:flutter/material.dart';
import 'package:code_line/src/constants/app_constants.dart';
import 'package:code_line/src/common_widgets/glass_container.dart';
import 'package:code_line/src/common_widgets/responsive_wrapper.dart';
import 'package:flutter_animate/flutter_animate.dart';

class StandardExcellenceCard extends StatelessWidget {
  const StandardExcellenceCard({super.key});

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveWrapper.isMobile(context);

    return Container(
      width: double.infinity,
      child: GlassContainer(
        padding: EdgeInsets.all(isMobile ? 20 : 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Section
            if (isMobile)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColours.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:
                        const Icon(
                              Icons.verified_outlined,
                              color: AppColours.primary,
                              size: 28,
                            )
                            .animate(onPlay: (c) => c.repeat(reverse: true))
                            .scale(
                              begin: const Offset(1, 1),
                              end: const Offset(1.1, 1.1),
                              duration: 2.seconds,
                            ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Our Standard of Excellence',
                    style: AppTextStyle.h3.copyWith(fontSize: 24, height: 1.2),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Quality that speaks for itself',
                    style: AppTextStyle.body.copyWith(
                      color: AppColours.textSecondary,
                    ),
                  ),
                ],
              )
            else
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppColours.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child:
                        const Icon(
                              Icons.verified_outlined,
                              color: AppColours.primary,
                              size: 32,
                            )
                            .animate(onPlay: (c) => c.repeat(reverse: true))
                            .scale(
                              begin: const Offset(1, 1),
                              end: const Offset(1.1, 1.1),
                              duration: 2.seconds,
                            ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Our Standard of Excellence',
                        style: AppTextStyle.h3.copyWith(fontSize: 24),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Quality that speaks for itself',
                        style: AppTextStyle.bodyLarge.copyWith(
                          color: AppColours.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            SizedBox(height: isMobile ? 16 : 24),

            Text(
              'We don\'t just write code; we craft digital experiences. Every project undergoes rigorous testing and design refinement to ensure it meets our high standards.',
              style: isMobile
                  ? AppTextStyle.body.copyWith(fontSize: 14, height: 1.6)
                  : AppTextStyle.body.copyWith(height: 1.8),
            ),

            SizedBox(height: isMobile ? 20 : 24),

            Wrap(
              spacing: isMobile ? 8 : 16,
              runSpacing: isMobile ? 8 : 16,
              children: [
                _FeatureBadge(
                  icon: Icons.speed,
                  label: 'High Performance',
                  isMobile: isMobile,
                ),
                _FeatureBadge(
                  icon: Icons.security,
                  label: 'Secure by Design',
                  isMobile: isMobile,
                ),
                _FeatureBadge(
                  icon: Icons.auto_awesome,
                  label: 'Premium UI/UX',
                  isMobile: isMobile,
                ),
                _FeatureBadge(
                  icon: Icons.devices,
                  label: 'Fully Responsive',
                  isMobile: isMobile,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _FeatureBadge extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isMobile;

  const _FeatureBadge({
    required this.icon,
    required this.label,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 12 : 16,
        vertical: isMobile ? 6 : 8,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColours.textSecondary.withValues(alpha: 0.3),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: isMobile ? 14 : 16, color: AppColours.accent)
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scale(begin: const Offset(1, 1), end: const Offset(1.2, 1.2)),
          const SizedBox(width: 8),
          Text(
            label,
            style: AppTextStyle.body.copyWith(
              fontSize: isMobile ? 12 : 14,
              color: AppColours.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}
