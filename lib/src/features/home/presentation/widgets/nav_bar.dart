import 'package:flutter/material.dart';
import 'package:code_line/src/constants/app_constants.dart';
import 'package:code_line/src/common_widgets/glass_container.dart';
import 'package:code_line/src/common_widgets/responsive_wrapper.dart';
import 'package:code_line/src/common_widgets/gradient_button.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

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
            Row(
              children: [
                Icon(Icons.code, color: AppColours.primary, size: 32),
                const SizedBox(width: 8),
                Text(
                  'Codeline',
                  style: AppTextStyle.h4.copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),

            // Desktop Links
            if (MediaQuery.of(context).size.width > AppBreakpoints.mobile)
              Row(
                children: [
                  _NavBarItem(title: 'Home', isActive: true),
                  _NavBarItem(title: 'Services'),
                  _NavBarItem(title: 'About'),
                  _NavBarItem(title: 'Contact'),
                  const SizedBox(width: 24),
                  GradientButton(text: 'Get Started', onPressed: () {}),
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

  const _NavBarItem({Key? key, required this.title, this.isActive = false})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: AppTextStyle.navLink.copyWith(
          color: isActive ? AppColours.primary : AppColours.textSecondary,
          fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
    );
  }
}
