import 'package:infobluera/src/common_widgets/glass_container.dart';
import 'package:infobluera/src/common_widgets/responsive_wrapper.dart';
import 'package:infobluera/src/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:visibility_detector/visibility_detector.dart';

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
      decoration: BoxDecoration(
        color: AppColours.background,
        // Optional: Subtle gradient or pattern can be added here
      ),
      child: ResponsiveWrapper(
        child: Column(
          children: [
            VisibilityDetector(
              key: const Key('team_header'),
              onVisibilityChanged: (info) {
                if (info.visibleFraction > 0.2) {
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
                  SizedBox(
                        width: 700,
                        child: Text(
                          'A group of passionate developers and designers dedicated to building scalable, high-performance digital solutions.',
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
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 700;
                final isTablet = constraints.maxWidth < 1100 && !isMobile;

                // 1 col mobile, 2 col tablet, 4 col desktop (or 2x2 grid if preferred)
                // Given 4 members, 4 columns on wide screens or 2x2 grid is good.
                // Let's go with responsive grid.
                int crossAxisCount = isMobile
                    ? 1
                    : (isTablet
                          ? 2
                          : 2); // 2 columns looks better for descriptions than 4 crammed ones.
                if (constraints.maxWidth > 1200) {
                  crossAxisCount = 4;
                }

                return Wrap(
                  spacing: 24,
                  runSpacing: 24,
                  alignment: WrapAlignment.center,
                  children: kTeamMembers.asMap().entries.map((entry) {
                    return _TeamCard(
                      member: entry.value,
                      index: entry.key,
                      width: _cardWidth(constraints.maxWidth, crossAxisCount),
                      isVisible: _isVisible,
                    );
                  }).toList(),
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

class TeamMember {
  final String name;
  final String role;
  final String description;
  final Color accentColor;

  const TeamMember({
    required this.name,
    required this.role,
    required this.description,
    required this.accentColor,
  });
}

final List<TeamMember> kTeamMembers = [
  TeamMember(
    name: 'Hari',
    role: 'Senior UI/UX Designer & Flutter Developer',
    description:
        'Designs intuitive user experiences and transforms them into high-performance Flutter applications with a strong focus on usability and aesthetics.',
    accentColor: Colors.purple,
  ),
  TeamMember(
    name: 'Abin',
    role: 'Senior Flutter Developer & Node.js Developer',
    description:
        'Specializes in full-stack development, delivering seamless Flutter applications backed by reliable and scalable Node.js architectures.',
    accentColor: Colors.green,
  ),
  TeamMember(
    name: 'Rishad',
    role: 'Senior Flutter Developer, Node.js & DevOps',
    description:
        'Builds scalable Flutter and Node.js applications, manages PostgreSQL databases, and implements CI/CD pipelines on AWS to ensure secure, reliable systems.',
    accentColor: Colors.blue,
  ),
  TeamMember(
    name: 'Arun',
    role: 'Senior Flutter Developer & Software Tester',
    description:
        'Builds scalable mobile applications, manages project architecture, and ensures high product quality through rigorous testing and performance optimization.',
    accentColor: Colors.orange,
  ),
];

class _TeamCard extends StatefulWidget {
  final TeamMember member;
  final int index;
  final double width;
  final bool isVisible;

  const _TeamCard({
    required this.member,
    required this.index,
    required this.width,
    required this.isVisible,
  });

  @override
  State<_TeamCard> createState() => _TeamCardState();
}

class _TeamCardState extends State<_TeamCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final delay = widget.index * 100;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child:
          AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOutCubic,
                width: widget.width,
                transform: _isHovered
                    ? Matrix4.translationValues(0, -8, 0)
                    : Matrix4.identity(),
                child: GlassContainer(
                  opacity: _isHovered ? 0.08 : 0.03,
                  color: _isHovered
                      ? widget.member.accentColor.withValues(alpha: 0.05)
                      : AppColours.surface.withValues(alpha: 0.03),
                  border: Border.all(
                    color: _isHovered
                        ? widget.member.accentColor.withValues(alpha: 0.3)
                        : Colors.white.withValues(alpha: 0.1),
                  ),
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar / Letter
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: widget.member.accentColor.withValues(
                            alpha: 0.2,
                          ),
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: widget.member.accentColor.withValues(
                              alpha: 0.5,
                            ),
                            width: 2,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          widget.member.name[0],
                          style: AppTextStyle.h3.copyWith(
                            color: widget.member.accentColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        widget.member.name,
                        style: AppTextStyle.h4.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.member.role,
                        style: AppTextStyle.body.copyWith(
                          color: widget.member.accentColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.member.description,
                        style: AppTextStyle.body.copyWith(
                          color: Colors.white70,
                          height: 1.5,
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .animate(target: widget.isVisible ? 1 : 0)
              .fadeIn(delay: delay.ms, duration: 500.ms)
              .slideY(begin: 0.2, end: 0, delay: delay.ms, duration: 500.ms),
    );
  }
}
