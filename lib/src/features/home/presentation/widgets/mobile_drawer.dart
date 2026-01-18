import 'dart:ui';

import 'package:code_line/src/common_widgets/gradient_button.dart';
import 'package:code_line/src/constants/app_constants.dart';
import 'package:flutter/material.dart';

class MobileDrawer extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onServicesTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onPortfolioTap;
  final VoidCallback? onContactTap;

  const MobileDrawer({
    super.key,
    this.onHomeTap,
    this.onServicesTap,
    this.onAboutTap,
    this.onPortfolioTap,
    this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    // We use a Stack to place the glass effect and content
    return Stack(
      children: [
        // Backdrop filter for the blur effect behind the drawer
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(color: Colors.black.withValues(alpha: 0.5)),
        ),

        // The Drawer Content
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.85,
            height: double.infinity,
            decoration: BoxDecoration(
              color: AppColours.background.withValues(alpha: 0.9),
              border: Border(
                left: BorderSide(
                  color: Colors.white.withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.5),
                  blurRadius: 30,
                  offset: const Offset(-10, 0),
                ),
              ],
            ),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.code,
                              color: AppColours.primary,
                              size: 32,
                            ),
                            const SizedBox(width: 12),
                            Text(
                              'Codeline',
                              style: AppTextStyle.h3.copyWith(fontSize: 24),
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.05),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.close,
                              color: AppColours.textSecondary,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const Divider(color: Colors.white10),
                  const SizedBox(height: 20),

                  // Menu Items
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      children: [
                        _DrawerItem(
                          title: 'Home',
                          icon: Icons.home_outlined,
                          onTap: () {
                            Navigator.pop(context);
                            onHomeTap?.call();
                          },
                          isActive: true,
                        ),
                        _DrawerItem(
                          title: 'About',
                          icon: Icons.info_outline,
                          onTap: () {
                            Navigator.pop(context);
                            onAboutTap?.call();
                          },
                        ),
                        _DrawerItem(
                          title: 'Services',
                          icon: Icons.grid_view_outlined,
                          onTap: () {
                            Navigator.pop(context);
                            onServicesTap?.call();
                          },
                        ),
                        _DrawerItem(
                          title: 'Portfolio',
                          icon: Icons.layers_outlined,
                          onTap: () {
                            Navigator.pop(context);
                            onPortfolioTap?.call();
                          },
                        ),
                      ],
                    ),
                  ),

                  // Footer / CTA
                  Container(
                    padding: const EdgeInsets.all(24),
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.02),
                      border: Border(
                        top: BorderSide(
                          color: Colors.white.withValues(alpha: 0.05),
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: GradientButton(
                            text: 'Contact Us',
                            onPressed: () {
                              Navigator.pop(context);
                              onContactTap?.call();
                            },
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '© 2024 Codeline. All rights reserved.',
                              style: AppTextStyle.caption.copyWith(
                                color: AppColours.textTertiary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;
  final bool isActive;

  const _DrawerItem({
    required this.title,
    required this.icon,
    required this.onTap,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: isActive
                  ? AppColours.primary.withValues(alpha: 0.1)
                  : Colors.transparent,
              border: Border.all(
                color: isActive
                    ? AppColours.primary.withValues(alpha: 0.2)
                    : Colors.transparent,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isActive
                      ? AppColours.primary
                      : AppColours.textSecondary,
                  size: 22,
                ),
                const SizedBox(width: 16),
                Text(
                  title,
                  style: AppTextStyle.bodyLarge.copyWith(
                    color: isActive
                        ? AppColours.textPrimary
                        : AppColours.textSecondary,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
                const Spacer(),
                if (isActive)
                  Container(
                    width: 6,
                    height: 6,
                    decoration: const BoxDecoration(
                      color: AppColours.primary,
                      shape: BoxShape.circle,
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
