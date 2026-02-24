import 'package:infobluera/src/common_widgets/glass_container.dart';
import 'package:infobluera/src/common_widgets/gradient_button.dart';
import 'package:infobluera/src/common_widgets/responsive_wrapper.dart';
import 'package:infobluera/src/constants/app_constants.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onServicesTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onPortfolioTap;
  final VoidCallback? onContactTap;

  const NavBar({
    super.key,
    this.onHomeTap,
    this.onServicesTap,
    this.onAboutTap,
    this.onPortfolioTap,
    this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      borderRadius: BorderRadius.zero,
      color: AppColours.background,
      opacity: 0.7,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: ResponsiveWrapper(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            GestureDetector(
              onTap: onHomeTap,
              child: Row(
                children: [
                  Icon(Icons.code, color: AppColours.primary, size: 32),
                  const SizedBox(width: 8),
                  Text(
                    'InfoBluera',
                    style: AppTextStyle.h4.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Desktop Links
            if (MediaQuery.of(context).size.width > AppBreakpoints.mobile)
              Row(
                children: [
                  _NavBarItem(title: 'Home', onTap: onHomeTap, isActive: true),
                  _NavBarItem(title: 'About', onTap: onAboutTap),
                  _NavBarItem(title: 'Services', onTap: onServicesTap),
                  _NavBarItem(title: 'Portfolio', onTap: onPortfolioTap),
                  const SizedBox(width: 24),
                  GradientButton(
                    text: 'Contact Us',
                    onPressed: onContactTap ?? () {},
                  ),
                ],
              )
            else
              IconButton(
                icon: const Icon(Icons.menu, color: AppColours.textPrimary),
                onPressed: () {
                  // Open drawer
                  Scaffold.of(context).openEndDrawer();
                },
              ),
          ],
        ),
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final bool isActive;
  final VoidCallback? onTap;

  const _NavBarItem({
    
    required this.title,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          title,
          style: AppTextStyle.navLink.copyWith(
            color: isActive ? AppColours.primary : AppColours.textSecondary,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
