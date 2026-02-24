import 'package:infobluera/src/common_widgets/glass_container.dart';
import 'package:infobluera/src/constants/app_constants.dart';
import 'package:infobluera/src/features/home/domain/project_model.dart';
import 'package:infobluera/src/common_widgets/responsive_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectDetailView extends StatelessWidget {
  final Project project;

  const ProjectDetailView({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isMobile = ResponsiveWrapper.isMobile(context);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.all(isMobile ? 12 : 24),
      child: SizedBox(
        width: isMobile ? screenSize.width : 1000,
        height: isMobile ? screenSize.height * 0.9 : 800,
        child: GlassContainer(
          padding: EdgeInsets.zero,
          child: Column(
            children: [
              // Header Image
              Expanded(
                flex: isMobile ? 3 : 4,
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(24),
                        ),
                        image: DecorationImage(
                          image: NetworkImage(project.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    // Close Button
                    Positioned(
                      top: 16,
                      right: 16,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Content
              Expanded(
                flex: 6,
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(isMobile ? 20 : 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: project.color.withOpacity(0.1),
                          border: Border.all(color: project.color),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          project.category,
                          style: AppTextStyle.caption.copyWith(
                            color: project.color,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        project.title,
                        style: isMobile
                            ? AppTextStyle.h2.copyWith(
                                color: Colors.white,
                                fontSize: 32,
                              )
                            : AppTextStyle.h2.copyWith(color: Colors.white),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        project.description.isNotEmpty
                            ? project.description
                            : 'A cutting-edge solution designed to address complex challenges with intuitive design and robust engineering.',
                        style: AppTextStyle.bodyLarge.copyWith(
                          height: 1.8,
                          fontSize: isMobile ? 16 : 18,
                        ),
                      ),
                      const SizedBox(height: 32),
                      if (project.technologies.isNotEmpty) ...[
                        Text(
                          'Technologies',
                          style: AppTextStyle.h4.copyWith(
                            color: Colors.white,
                            fontSize: isMobile ? 20 : 24,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Wrap(
                          spacing: 12,
                          runSpacing: 12,
                          children: project.technologies
                              .map((tech) => _TechBadge(label: tech))
                              .toList(),
                        ),
                        const SizedBox(height: 32),
                      ],
                      if (project.features.isNotEmpty) ...[
                        Text(
                          'Key Features',
                          style: AppTextStyle.h4.copyWith(
                            color: Colors.white,
                            fontSize: isMobile ? 20 : 24,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ...project.features.map(
                          (feature) => Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.check_circle_outline,
                                  color: project.color,
                                  size: 20,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    feature,
                                    style: AppTextStyle.body.copyWith(
                                      fontSize: isMobile ? 14 : 16,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn().scale(duration: 300.ms);
  }
}

class _TechBadge extends StatelessWidget {
  final String label;

  const _TechBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColours.surfaceLight,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: AppTextStyle.body.copyWith(
          fontSize: 14,
          color: AppColours.textPrimary,
        ),
      ),
    );
  }
}
