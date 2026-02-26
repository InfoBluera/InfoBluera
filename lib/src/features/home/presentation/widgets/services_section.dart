import 'package:infobluera/src/common_widgets/glass_container.dart';
import 'package:infobluera/src/common_widgets/responsive_wrapper.dart';
import 'package:infobluera/src/constants/app_constants.dart';
import 'package:infobluera/src/features/home/presentation/widgets/service_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ServicesSection extends StatefulWidget {
  const ServicesSection({super.key});

  @override
  State<ServicesSection> createState() => _ServicesSectionState();
}

class _ServicesSectionState extends State<ServicesSection> {
  // Track visibility of the grid to trigger stagger animation
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWrapper.isMobile(context);
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 20 : 100,
        horizontal: 12,
      ),
      // Add a subtle background gradient for the section
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            AppColours.primary.withValues(alpha: 0.05),
            Colors.transparent,
          ],
        ),
      ),
      child: ResponsiveWrapper(
        child: Column(
          children: [
            VisibilityDetector(
              key: const Key('services_header'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.2) {
                  setState(() => _isVisible = true);
                }
              },
              child: Column(
                children: [
                  Text(
                        'Our Expertise',
                        style: AppTextStyle.caption.copyWith(
                          color: AppColours.accent,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      )
                      .animate(target: _isVisible ? 1 : 0)
                      .fadeIn()
                      .slideY(begin: 0.5),
                  const SizedBox(height: 12),
                  Text(
                        'Comprehensive IT Solutions',
                        style: isMobile
                            ? AppTextStyle.h2.copyWith(fontSize: 24)
                            : AppTextStyle.h2,
                        textAlign: TextAlign.center,
                      )
                      .animate(target: _isVisible ? 1 : 0)
                      .fadeIn(delay: 100.ms)
                      .slideY(begin: 0.5),
                  const SizedBox(height: 24),
                  SizedBox(
                        width: 700,
                        // child: Text(
                        //   'We deliver end-to-end digital services, moving from concept to deployment with precision and speed.',
                        //   style: isMobile
                        //       ? AppTextStyle.bodyLarge.copyWith(fontSize: 14)
                        //       : AppTextStyle.bodyLarge,
                        //   textAlign: TextAlign.center,
                        // ),
                        child: Text(
                          'We deliver comprehensive end-to-end digital solutions, guiding businesses through every stage of the development lifecycle—from initial idea validation, strategic planning, and UI/UX design to full-scale development, testing, deployment, and ongoing support. Our expert team ensures every product is built with precision, speed, scalability, and security, using modern technologies and industry best practices. We help businesses transform concepts into powerful web applications, mobile apps, and enterprise software that are reliable, high-performing, and future-ready. Our streamlined development process ensures faster time-to-market, seamless performance, and technology solutions that drive innovation, improve operational efficiency, and support long-term business growth.',
                          style: isMobile
                              ? AppTextStyle.bodyLarge.copyWith(
                                  fontSize: 14,
                                  height: 1.8,
                                )
                              : AppTextStyle.bodyLarge.copyWith(height: 1.8),
                          textAlign: TextAlign.justify,
                        ),
                      )
                      .animate(target: _isVisible ? 1 : 0)
                      .fadeIn(delay: 200.ms)
                      .slideY(begin: 0.5),
                ],
              ),
            ),
            const SizedBox(height: 80),
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 700;
                final isTablet = constraints.maxWidth < 1100 && !isMobile;

                // Calculate columns
                int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);

                return Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: List.generate(kServiceItems.length, (index) {
                    return _AnimatedServiceCard(
                      item: kServiceItems[index],
                      index: index,
                      width: _cardWidth(constraints.maxWidth, crossAxisCount),
                      isVisible: _isVisible,
                    );
                  }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  double _cardWidth(double maxWidth, int columns) {
    if (columns == 1) return maxWidth;
    return (maxWidth - (24 * (columns - 1))) / columns;
  }
}

// class _AnimatedServiceCard extends StatefulWidget {
//   final ServiceItemModel item;
//   final int index;
//   final double width;
//   final bool isVisible;
//
//   const _AnimatedServiceCard({
//     required this.item,
//     required this.index,
//     required this.width,
//     required this.isVisible,
//   });
//
//   @override
//   State<_AnimatedServiceCard> createState() => _AnimatedServiceCardState();
// }
//
// class _AnimatedServiceCardState extends State<_AnimatedServiceCard> {
//   bool _isHovered = false;
//
//   @override
//   Widget build(BuildContext context) {
//     // Stagger delay based on index
//     final delay = widget.index * 100;
//     final isMobile = ResponsiveWrapper.isMobile(context);
//
//     return MouseRegion(
//       onEnter: (_) => setState(() => _isHovered = true),
//       onExit: (_) => setState(() => _isHovered = false),
//       child:
//           AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 curve: Curves.easeOutCubic,
//                 width: widget.width,
//                 constraints:  BoxConstraints(minHeight: isMobile?300:380),
//                 // Lift effect on hover
//                 transform: _isHovered
//                     ? Matrix4.translationValues(0, -12, 0)
//                     : Matrix4.identity(),
//                 child: GlassContainer(
//                   // On hover, increase opacity and add a colored tint
//                   color: _isHovered
//                       ? widget.item.accentColor.withValues(alpha: 0.05)
//                       : AppColours.surface.withValues(alpha: 0.02),
//                   opacity: _isHovered ? 0.9 : 0.02,
//                   border: Border.all(
//                     color: _isHovered
//                         ? widget.item.accentColor.withValues(alpha: 0.3)
//                         : Colors.white.withValues(alpha: 0.08),
//                     width: 1,
//                   ),
//
//                   padding: const EdgeInsets.all(32),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Icon with glowing background on hover
//                       AnimatedContainer(
//                             duration: const Duration(milliseconds: 300),
//                             padding: const EdgeInsets.all(16),
//                             decoration: BoxDecoration(
//                               color: _isHovered
//                                   ? widget.item.accentColor.withValues(
//                                       alpha: 0.2,
//                                     )
//                                   : widget.item.accentColor.withValues(
//                                       alpha: 0.1,
//                                     ),
//                               borderRadius: BorderRadius.circular(16),
//                               boxShadow: _isHovered
//                                   ? [
//                                       BoxShadow(
//                                         color: widget.item.accentColor
//                                             .withValues(alpha: 0.3),
//                                         blurRadius: 20,
//                                         spreadRadius: 2,
//                                       ),
//                                     ]
//                                   : [],
//                             ),
//                             child: Icon(
//                               widget.item.icon,
//                               color: widget.item.accentColor,
//                               size: isMobile ? 24 : 32,
//                             ),
//                           )
//                           .animate(target: _isHovered ? 1 : 0)
//                           .scale(end: const Offset(1.1, 1.1)),
//
//                       const SizedBox(height: 24),
//                       Text(
//                         widget.item.title,
//                         style: AppTextStyle.h4.copyWith(
//                           color: _isHovered ? Colors.white : Colors.white70,
//                           fontSize: isMobile ? 16 : 24,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         widget.item.description,
//                         style: AppTextStyle.body.copyWith(
//                           color: Colors.white60,
//                           height: 1.5,
//                           fontSize: isMobile ? 13 : 16,
//                         ),
//                         textAlign: TextAlign.justify,
//                       ),
//                       const SizedBox(height: 32),
//
//                       // Learn More Button/Link
//                       AnimatedOpacity(
//                         opacity: _isHovered ? 1.0 : 0.6,
//                         duration: const Duration(milliseconds: 200),
//                         child: Row(
//                           children: [
//                             Text(
//                               'Learn More',
//                               style: AppTextStyle.button.copyWith(
//                                 color: _isHovered
//                                     ? widget.item.accentColor
//                                     : Colors.white70,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             const SizedBox(width: 8),
//                             Icon(
//                               Icons.arrow_forward_rounded,
//                               size: 18,
//                               color: _isHovered
//                                   ? widget.item.accentColor
//                                   : Colors.white70,
//                             ).animate(target: _isHovered ? 1 : 0).moveX(end: 5),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//               .animate(target: widget.isVisible ? 1 : 0)
//               .fadeIn(delay: delay.ms, duration: 600.ms, curve: Curves.easeOut)
//               .slideY(
//                 begin: 0.2,
//                 end: 0,
//                 delay: delay.ms,
//                 duration: 600.ms,
//                 curve: Curves.easeOut,
//               ),
//     );
//   }
// }


class _AnimatedServiceCard extends StatefulWidget {
  final ServiceItemModel item;
  final int index;
  final double width;
  final bool isVisible;

  const _AnimatedServiceCard({
    required this.item,
    required this.index,
    required this.width,
    required this.isVisible,
  });

  @override
  State<_AnimatedServiceCard> createState() => _AnimatedServiceCardState();
}

class _AnimatedServiceCardState extends State<_AnimatedServiceCard> {
  bool _isHovered = false;

  void _setHover(bool value, bool isMobile) {
    if (!isMobile) {
      setState(() => _isHovered = value);
    }
  }

  void _setTap(bool value, bool isMobile) {
    if (isMobile) {
      setState(() => _isHovered = value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final delay = widget.index * 100;
    final isMobile = ResponsiveWrapper.isMobile(context);

    /// ⭐ IMPORTANT FIX
    /// Mobile = always active
    final isActive = isMobile || _isHovered;

    return GestureDetector(
      onTapDown: (_) => _setTap(true, isMobile),
      onTapUp: (_) => _setTap(false, isMobile),
      onTapCancel: () => _setTap(false, isMobile),

      child: MouseRegion(
        onEnter: (_) => _setHover(true, isMobile),
        onExit: (_) => _setHover(false, isMobile),

        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOutCubic,
          width: widget.width,
          constraints: BoxConstraints(
            minHeight: isMobile ? 300 : 380,
          ),

          /// Lift effect
          transform: isActive
              ? Matrix4.translationValues(0, -12, 0)
              : Matrix4.identity(),

          child: GlassContainer(
            /// Background color
            color: isActive
                ? widget.item.accentColor.withValues(alpha: 0.02)
                : AppColours.surface.withValues(alpha: 0.02),

            /// Opacity FIXED
            opacity: isActive ? 0.95 : 0.25,

            border: Border.all(
              color: isActive
                  ? widget.item.accentColor.withValues(alpha: 0.35)
                  : Colors.white.withValues(alpha: 0.08),
              width: 1,
            ),

            padding: const EdgeInsets.all(32),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                /// ICON
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: widget.item.accentColor.withValues(
                      alpha: isActive ? 0.20 : 0.10,
                    ),
                    borderRadius: BorderRadius.circular(16),

                    boxShadow: isActive
                        ? [
                      BoxShadow(
                        color: widget.item.accentColor
                            .withValues(alpha: 0.35),
                        blurRadius: 24,
                        spreadRadius: 2,
                      ),
                    ]
                        : [],
                  ),
                  child: Icon(
                    widget.item.icon,
                    color: widget.item.accentColor,
                    size: isMobile ? 24 : 32,
                  ),
                )
                    .animate(target: isActive ? 1 : 0)
                    .scale(
                  end: const Offset(1.1, 1.1),
                  duration: 300.ms,
                ),

                const SizedBox(height: 24),

                /// TITLE
                Text(
                  widget.item.title,
                  style: AppTextStyle.h4.copyWith(
                    color: isActive
                        ? Colors.white
                        : Colors.white.withValues(alpha: 0.85),
                    fontSize: isMobile ? 16 : 24,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const SizedBox(height: 12),

                /// DESCRIPTION
                Text(
                  widget.item.description,
                  style: AppTextStyle.body.copyWith(
                    color: Colors.white.withValues(alpha: 0.65),
                    height: 1.6,
                    fontSize: isMobile ? 13 : 16,
                  ),
                  textAlign: TextAlign.justify,
                ),

                const SizedBox(height: 32),

                /// LEARN MORE
                // AnimatedOpacity(
                //   opacity: isActive ? 1.0 : 0.6,
                //   duration: const Duration(milliseconds: 200),
                //
                //   child: Row(
                //     children: [
                //
                //       Text(
                //         'Learn More',
                //         style: AppTextStyle.button.copyWith(
                //           color: isActive
                //               ? widget.item.accentColor
                //               : Colors.white70,
                //           fontWeight: FontWeight.w500,
                //         ),
                //       ),
                //
                //       const SizedBox(width: 8),
                //
                //       Icon(
                //         Icons.arrow_forward_rounded,
                //         size: 18,
                //         color: isActive
                //             ? widget.item.accentColor
                //             : Colors.white70,
                //       )
                //           .animate(target: isActive ? 1 : 0)
                //           .moveX(
                //         end: 6,
                //         duration: 300.ms,
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        )

        /// Entry animation
            .animate(target: widget.isVisible ? 1 : 0)
            .fadeIn(
          delay: delay.ms,
          duration: 600.ms,
          curve: Curves.easeOut,
        )
            .slideY(
          begin: 0.2,
          end: 0,
          delay: delay.ms,
          duration: 600.ms,
          curve: Curves.easeOut,
        ),
      ),
    );
  }
}