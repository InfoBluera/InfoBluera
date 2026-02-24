import 'package:infobluera/src/common_widgets/standard_excellence_card.dart';
import 'package:infobluera/src/features/home/domain/project_model.dart';
import 'package:infobluera/src/features/home/presentation/widgets/project_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:infobluera/src/constants/app_constants.dart';
import 'package:infobluera/src/common_widgets/responsive_wrapper.dart';

import 'package:flutter_animate/flutter_animate.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWrapper.isMobile(context);
    final List<Project> projects = [
      Project(
        title: 'Niska',
        category: 'E-Commerce Platform',
        image:
            'https://images.unsplash.com/photo-1523474253046-8cd2748b5fd2?q=80&w=2070&auto=format&fit=crop',
        color: const Color(0xFFFACC15), // Yellow tone
        description:
            'A high-performance e-commerce platform built for scale. Features real-time inventory management, AI-driven product recommendations, and a seamless checkout experience.',
        technologies: ['Flutter', 'Firebase', 'Stripe', 'Node.js'],
        features: [
          'Real-time Inventory Sync',
          'AI Product Recommendations',
          'Multi-currency Support',
        ],
      ),
      Project(
        title: 'CityHub',
        category: 'Smart City Dashboard',
        image:
            'https://images.unsplash.com/photo-1573164713988-8665fc963095?q=80&w=2069&auto=format&fit=crop',
        color: const Color(0xFF3B82F6), // Blue tone
        description:
            'An integrated dashboard for modern smart cities, visualizing real-time data from IoT sensors to manage traffic, energy consumption, and public safety.',
        technologies: [
          'Flutter Web',
          'Google Maps API',
          'IoT Core',
          'BigQuery',
        ],
        features: [
          'Live Traffic Visualizations',
          'Energy Grid Monitoring',
          'Emergency Response Integration',
        ],
      ),
      Project(
        title: 'Skill App',
        category: 'EdTech Mobile App',
        image:
            'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?q=80&w=2070&auto=format&fit=crop',
        color: const Color(0xFF10B981), // Green tone
        description:
            'A gamified learning experience that helps users master new skills through interactive lessons, quizzes, and peer-to-peer mentorship.',
        technologies: ['Flutter', 'Dart', 'GraphQL', 'AWS'],
        features: [
          'Interactive Video Lessons',
          'Gamified Progress Tracking',
          'Peer Mentorship Matching',
        ],
      ),
    ];

    // return Container(
    //   padding: const EdgeInsets.symmetric(vertical: 100),
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       ResponsiveWrapper(
    //         child: Padding(
    //           padding: const EdgeInsets.symmetric(horizontal: 24),
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Row(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 crossAxisAlignment: CrossAxisAlignment.end,
    //                 children: [
    //                   Expanded(
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.center,
    //                       children: [
    //                         Text(
    //                           'FEATURED WORK',
    //                           style: AppTextStyle.caption.copyWith(
    //                             color: AppColours.accent,
    //                             fontWeight: FontWeight.bold,
    //                             letterSpacing: 1.2,
    //                           ),
    //                         ).animate().fadeIn(),
    //                         const SizedBox(height: 8),
    //                         Text(
    //                           'Our Standard of Excellence',
    //                           style: ResponsiveWrapper.isMobile(context)
    //                               ? AppTextStyle.h2.copyWith(fontSize: 32)
    //                               : AppTextStyle.h2,
    //                         ).animate().fadeIn().slideX(),
    //                       ],
    //                     ),
    //                   ),
    //                   // _ViewAllButton(),
    //                 ],
    //               ),
    //               const SizedBox(height: 48),
    //               const StandardExcellenceCard().animate().fadeIn().slideY(
    //                 begin: 0.2,
    //                 curve: Curves.easeOut,
    //               ),
    //             ],
    //           ),
    //         ),
    //       ),
    //       const SizedBox(height: 60),
    //       // Horizontal Scroll for Mobile/Tablet, Grid for Desktop could be better but list requested
    //       SizedBox(
    //         height: isMobile ? 350 : 500,
    //         child: ListView.builder(
    //           scrollDirection: Axis.horizontal,
    //            padding: const EdgeInsets.symmetric(horizontal: 24),
    //           physics: const BouncingScrollPhysics(),
    //           itemCount: projects.length,
    //           itemBuilder: (context, index) {
    //             return _PortfolioCard(
    //                   project: projects[index],
    //                   margin: index != projects.length - 1
    //                       ? const EdgeInsets.only(right: 32)
    //                       : EdgeInsets.zero,
    //                 )
    //                 .animate()
    //                 .fadeIn(delay: (200 + (index * 100)).ms)
    //                 .slideX(begin: 0.2, curve: Curves.easeOutCubic);
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    // );

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      width: double.infinity,
      child: Column(
        children: [
          // ================= TOP CONTENT =================
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'FEATURED WORK',
                      style: AppTextStyle.caption.copyWith(
                        color: AppColours.accent,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ).animate().fadeIn(),

                    const SizedBox(height: 8),

                    Text(
                      'Our Standard of Excellence',
                      textAlign: TextAlign.center,
                      style: ResponsiveWrapper.isMobile(context)
                          ? AppTextStyle.h2.copyWith(fontSize: 32)
                          : AppTextStyle.h2,
                    ).animate().fadeIn().slideY(),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 48),

          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1200),
              child: const StandardExcellenceCard()
                  .animate()
                  .fadeIn()
                  .slideY(begin: 0.2, curve: Curves.easeOut),
            ),
          ),

          const SizedBox(height: 60),

          // ================= HORIZONTAL LIST =================
          SizedBox(
            height: isMobile ? 350 : 500,
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1400),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  physics: const BouncingScrollPhysics(),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return _PortfolioCard(
                      project: projects[index],
                      margin: index != projects.length - 1
                          ? const EdgeInsets.only(right: 32)
                          : EdgeInsets.zero,
                    )
                        .animate()
                        .fadeIn(delay: (200 + index * 100).ms)
                        .slideX(begin: 0.2, curve: Curves.easeOutCubic);
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }
}


class _PortfolioCard extends StatefulWidget {
  final Project project;
  final EdgeInsetsGeometry margin;

  const _PortfolioCard({
    required this.project,
    this.margin = EdgeInsets.zero,
  });

  @override
  State<_PortfolioCard> createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<_PortfolioCard> {
  bool _isHovered = false;

  void _showDetails() {
    showDialog(
      context: context,
      builder: (context) => ProjectDetailView(project: widget.project),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = ResponsiveWrapper.isMobile(context);
    double cardWidth = isMobile ? 300 : 350;

    return GestureDetector(
      onTap: _showDetails,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: Container(
          width: cardWidth,
          margin: widget.margin,
          child: Stack(
            children: [
              // Background Image
              AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeOutCubic,
                    transform: _isHovered
                        ? Matrix4.translationValues(0, -10, 0)
                        : Matrix4.identity(),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      image: DecorationImage(
                        image: NetworkImage(widget.project.image),
                        fit: BoxFit.cover,
                      ),
                      boxShadow: _isHovered
                          ? [
                              BoxShadow(
                                color: widget.project.color.withOpacity(0.3),
                                blurRadius: 30,
                                offset: const Offset(0, 20),
                              ),
                            ]
                          : [],
                    ),
                  )
                  .animate(target: _isHovered ? 1 : 0)
                  .shimmer(duration: 1.seconds, curve: Curves.easeInOut),

              // Gradient Overlay
              AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                transform: _isHovered
                    ? Matrix4.translationValues(0, -10, 0)
                    : Matrix4.identity(),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black.withOpacity(0.8)],
                    stops: const [0.5, 1.0],
                  ),
                ),
              ),

              // Content
              Positioned(
                bottom: isMobile ? 20 : 30,
                left: isMobile ? 16 : 24,
                right: isMobile ? 16 : 24,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  transform: _isHovered
                      ? Matrix4.translationValues(0, -10, 0)
                      : Matrix4.identity(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: widget.project.color.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          widget.project.category,
                          style: AppTextStyle.caption.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: isMobile ? 10 : 12,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.project.title,
                        style: isMobile
                            ? AppTextStyle.h4.copyWith(
                                height: 1.0,
                                fontSize: 24,
                                color: Colors.white,
                              )
                            : AppTextStyle.h3.copyWith(
                                height: 1.0,
                                color: Colors.white,
                              ),
                      ),
                      AnimatedSize(
                        duration: const Duration(milliseconds: 300),
                        child: SizedBox(
                          height: _isHovered ? null : 0,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Row(
                              children: [
                                Text(
                                  'View Case Study',
                                  style: AppTextStyle.button.copyWith(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                const Icon(
                                      Icons.arrow_forward,
                                      color: Colors.white,
                                      size: 14,
                                    )
                                    .animate(target: _isHovered ? 1 : 0)
                                    .moveX(begin: 0, end: 5),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
