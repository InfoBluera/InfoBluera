import 'package:flutter/material.dart';
import 'package:code_line/src/constants/app_constants.dart';
import 'package:code_line/src/features/home/presentation/widgets/nav_bar.dart';
import 'package:code_line/src/features/home/presentation/widgets/hero_section.dart';
import 'package:code_line/src/features/home/presentation/widgets/services_section.dart';
import 'package:code_line/src/features/home/presentation/widgets/portfolio_section.dart';
import 'package:code_line/src/features/home/presentation/widgets/footer_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.background,
      endDrawer: const _MobileDrawer(),
      body: Stack(
        children: [
          // Main Scrollable Content
          SingleChildScrollView(
            child: Column(
              children: [
                const HeroSection(),
                const ServicesSection(),
                const PortfolioSection(),
                const FooterSection(),
              ],
            ),
          ),

          // Fixed Navigation Bar
          const Positioned(top: 0, left: 0, right: 0, child: NavBar()),
        ],
      ),
    );
  }
}

class _MobileDrawer extends StatelessWidget {
  const _MobileDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColours.background,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: AppColours.primaryGradient,
            ),
            child: Center(
              child: Text(
                'Codeline',
                style: AppTextStyle.h3.copyWith(color: Colors.white),
              ),
            ),
          ),
          ListTile(
            title: Text('Home', style: AppTextStyle.bodyLarge),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Services', style: AppTextStyle.bodyLarge),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Portfolio', style: AppTextStyle.bodyLarge),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Contact', style: AppTextStyle.bodyLarge),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
