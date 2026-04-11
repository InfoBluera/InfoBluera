import 'package:infobluera/src/common_widgets/glass_container.dart';
import 'package:infobluera/src/common_widgets/responsive_wrapper.dart';
import 'package:infobluera/src/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

// class TeamSection extends StatefulWidget {
//   const TeamSection({super.key});
//
//   @override
//   State<TeamSection> createState() => _TeamSectionState();
// }
//
// class _TeamSectionState extends State<TeamSection> {
//   bool _isVisible = false;
//
//   @override
//   Widget build(BuildContext context) {
//     final isMobile = ResponsiveWrapper.isMobile(context);
//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
//       decoration: BoxDecoration(
//         color: AppColours.background,
//         // Optional: Subtle gradient or pattern can be added here
//       ),
//       child: ResponsiveWrapper(
//         child: Column(
//           children: [
//             VisibilityDetector(
//               key: const Key('team_header'),
//               onVisibilityChanged: (info) {
//                 if (info.visibleFraction > 0.2) {
//                   setState(() => _isVisible = true);
//                 }
//               },
//               child: Column(
//                 children: [
//                   Text(
//                     'Our Team',
//                     style: AppTextStyle.caption.copyWith(
//                       color: AppColours.accent,
//                       fontWeight: FontWeight.bold,
//                       letterSpacing: 1.2,
//                     ),
//                   )
//                       .animate(target: _isVisible ? 1 : 0)
//                       .fadeIn()
//                       .slideY(begin: 0.5),
//                   const SizedBox(height: 12),
//                   Text(
//                     'Meet the Minds Behind the Code',
//                     style: isMobile
//                         ? AppTextStyle.h2.copyWith(fontSize: 32)
//                         : AppTextStyle.h2,
//                     textAlign: TextAlign.center,
//                   )
//                       .animate(target: _isVisible ? 1 : 0)
//                       .fadeIn(delay: 100.ms)
//                       .slideY(begin: 0.5),
//                   const SizedBox(height: 24),
//                   SizedBox(
//                     width: 700,
//                     child: Text(
//                       'A group of passionate developers and designers dedicated to building scalable, high-performance digital solutions.',
//                       style: AppTextStyle.bodyLarge,
//                       textAlign: TextAlign.center,
//                     ),
//                   )
//                       .animate(target: _isVisible ? 1 : 0)
//                       .fadeIn(delay: 200.ms)
//                       .slideY(begin: 0.5),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 60),
//
//           ],
//         ),
//       ),
//     );
//   }
//
// }


import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_animate/flutter_animate.dart';

class TeamSection extends StatefulWidget {
  const TeamSection({super.key});

  @override
  State<TeamSection> createState() => _TeamSectionState();
}

class _TeamSectionState extends State<TeamSection> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWrapper.isMobile(context);

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 24),
      decoration: const BoxDecoration(
        color: AppColours.background,
      ),
      child: ResponsiveWrapper(
        child: Column(
          children: [
            /// ================= HEADER SECTION =================
            VisibilityDetector(
              key: const Key('team_header'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.2 && !_isVisible) {
                  setState(() => _isVisible = true);
                }
              },
              child: Column(
                children: [
                  Text(
                    'Our Team',
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
                    'Meet the Minds Behind the Code',
                    style: isMobile
                        ? AppTextStyle.h2.copyWith(fontSize: 32)
                        : AppTextStyle.h2,
                    textAlign: TextAlign.center,
                  )
                      .animate(target: _isVisible ? 1 : 0)
                      .fadeIn(delay: 100.ms)
                      .slideY(begin: 0.5),

                  const SizedBox(height: 24),

                  /// ================= DESCRIPTION =================
                  SizedBox(
                    width: 900,
                    child: Text(
                      'Behind every successful app is a team that understands both technology and vision. '
                          'We are a passionate Flutter development team with proven experience delivering 3–5 complete, '
                          'production-ready applications across multiple industries.\n\n'
                          'From intuitive UI/UX design to robust backend integration, we specialize in building secure, '
                          'scalable, and high-performing cross-platform applications using Flutter. Our expertise includes '
                          'advanced state management, RESTful API integration, Firebase services, payment gateway integration, '
                          'real-time features, and performance optimization.\n\n'
                          'We believe in writing clean, maintainable code and delivering products that are not only visually '
                          'impressive but also technically strong. Our goal is simple: build digital experiences that users love '
                          'and businesses trust.',
                      style: AppTextStyle.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  )
                      .animate(target: _isVisible ? 1 : 0)
                      .fadeIn(delay: 200.ms)
                      .slideY(begin: 0.5),
                ],
              ),
            ),

            const SizedBox(height: 60),

            /// ================= HIGHLIGHT STATS =================
            Wrap(
              spacing: 60,
              runSpacing: 30,
              alignment: WrapAlignment.center,
              children: [
                _buildHighlight("5+", "Projects Delivered"),
                _buildHighlight("100%", "Client Satisfaction"),
                _buildHighlight("Android • iOS • Web", "Cross-Platform Apps"),
                _buildHighlight("Clean Code", "Scalable Architecture"),
              ],
            )
                .animate(target: _isVisible ? 1 : 0)
                .fadeIn(delay: 400.ms)
                .slideY(begin: 0.3),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  /// ================= HIGHLIGHT WIDGET =================
  Widget _buildHighlight(String title, String subtitle) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyle.h3.copyWith(
            color: AppColours.accent,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          subtitle,
          style: AppTextStyle.body,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
