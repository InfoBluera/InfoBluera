import 'package:flutter/material.dart';
import 'package:code_line/src/constants/app_constants.dart';
import 'package:code_line/src/common_widgets/responsive_wrapper.dart';

import 'package:flutter_animate/flutter_animate.dart';

class PortfolioSection extends StatelessWidget {
  const PortfolioSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 100),
      child: Column(
        children: [
          ResponsiveWrapper(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                          'Our Standard of\nExcellence',
                          style: AppTextStyle.h2,
                        ).animate().fadeIn().slideX(),
                      ],
                    ),
                  ),
                  _ViewAllButton(),
                ],
              ),
            ),
          ),
          const SizedBox(height: 60),
          // Horizontal Scroll for Mobile/Tablet, Grid for Desktop could be better but list requested
          SizedBox(
            height: 500,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              physics: const BouncingScrollPhysics(),
              children: [
                _PortfolioCard(
                  title: 'Niska',
                  category: 'E-Commerce Platform',
                  image:
                      'https://images.unsplash.com/photo-1523474253046-8cd2748b5fd2?q=80&w=2070&auto=format&fit=crop',
                  color: const Color(0xFFFACC15), // Yellow tone
                ),
                _PortfolioCard(
                  title: 'CityHub',
                  category: 'Smart City Dashboard',
                  image:
                      'https://images.unsplash.com/photo-1573164713988-8665fc963095?q=80&w=2069&auto=format&fit=crop',
                  color: const Color(0xFF3B82F6), // Blue tone
                ),
                _PortfolioCard(
                  title: 'Skill App',
                  category: 'EdTech Mobile App',
                  image:
                      'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?q=80&w=2070&auto=format&fit=crop',
                  color: const Color(0xFF10B981), // Green tone
                ),
                const SizedBox(width: 100), // Spacing at end
              ].animate(interval: 200.ms).fadeIn().slideX(begin: 0.2, curve: Curves.easeOutCubic),
            ),
          ),
        ],
      ),
    );
  }
}

class _ViewAllButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColours.textSecondary.withValues(alpha: 0.3),
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('View All Projects', style: AppTextStyle.button),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward, size: 16, color: Colors.white),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 400.ms);
  }
}

class _PortfolioCard extends StatefulWidget {
  final String title;
  final String category;
  final String image;
  final Color color;

  const _PortfolioCard({
    Key? key,
    required this.title,
    required this.category,
    required this.image,
    required this.color,
  }) : super(key: key);

  @override
  State<_PortfolioCard> createState() => _PortfolioCardState();
}

class _PortfolioCardState extends State<_PortfolioCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        width: 350,
        margin: const EdgeInsets.only(right: 32),
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
                  image: NetworkImage(widget.image),
                  fit: BoxFit.cover,
                ),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: widget.color.withValues(alpha: 0.3),
                          blurRadius: 30,
                          offset: const Offset(0, 20),
                        ),
                      ]
                    : [],
              ),
            ),

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
                  colors: [
                    Colors.transparent,
                    Colors.black.withValues(alpha: 0.8),
                  ],
                  stops: const [0.5, 1.0],
                ),
              ),
            ),

            // Content
            Positioned(
              bottom: 30,
              left: 24,
              right: 24,
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
                        color: widget.color.withValues(alpha: 0.9),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        widget.category,
                        style: AppTextStyle.caption.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.title,
                      style: AppTextStyle.h3.copyWith(height: 1.0),
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
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 14,
                              ),
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
    );
  }
}
