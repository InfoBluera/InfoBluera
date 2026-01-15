import 'package:code_line/src/constants/app_constants.dart';
import 'package:code_line/src/features/home/presentation/widgets/about_us_section.dart';
import 'package:code_line/src/features/home/presentation/widgets/footer_section.dart';
import 'package:code_line/src/features/home/presentation/widgets/hero_section.dart';
import 'package:code_line/src/features/home/presentation/widgets/nav_bar.dart';
import 'package:code_line/src/features/home/presentation/widgets/portfolio_section.dart';
import 'package:code_line/src/features/home/presentation/widgets/services_section.dart';
import 'package:code_line/src/features/home/presentation/widgets/team_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    Scrollable.ensureVisible(
      key.currentContext!,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.background,
      endDrawer: _MobileDrawer(
        onHomeTap: () => _scrollToSection(_homeKey),
        onServicesTap: () => _scrollToSection(_servicesKey),
        onAboutTap: () => _scrollToSection(_aboutKey),
        onPortfolioTap: () => _scrollToSection(_portfolioKey),
        onContactTap: () => _scrollToSection(_contactKey),
      ),
      body: Stack(
        children: [
          // Main Scrollable Content
          SingleChildScrollView(
            child: Column(
              children: [
                HeroSection(key: _homeKey),
                AboutUsSection(key: _aboutKey),
                ServicesSection(key: _servicesKey),
                PortfolioSection(key: _portfolioKey),
                TeamSection(),
                // Assuming FooterSection contains Contact info, or use it as Contact section
                FooterSection(key: _contactKey),
              ],
            ),
          ),

          // Fixed Navigation Bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              onHomeTap: () => _scrollToSection(_homeKey),
              onServicesTap: () => _scrollToSection(_servicesKey),
              onAboutTap: () => _scrollToSection(_aboutKey),
              onPortfolioTap: () => _scrollToSection(_portfolioKey),
              onContactTap: () => _scrollToSection(_contactKey),
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileDrawer extends StatelessWidget {
  final VoidCallback? onHomeTap;
  final VoidCallback? onServicesTap;
  final VoidCallback? onAboutTap;
  final VoidCallback? onPortfolioTap;
  final VoidCallback? onContactTap;

  const _MobileDrawer({
    this.onHomeTap,
    this.onServicesTap,
    this.onAboutTap,
    this.onPortfolioTap,
    this.onContactTap,
  }) : super();

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
            onTap: () {
              Navigator.pop(context);
              onHomeTap?.call();
            },
          ),
          ListTile(
            title: Text('About', style: AppTextStyle.bodyLarge),
            onTap: () {
              Navigator.pop(context);
              onAboutTap?.call();
            },
          ),
          ListTile(
            title: Text('Services', style: AppTextStyle.bodyLarge),
            onTap: () {
              Navigator.pop(context);
              onServicesTap?.call();
            },
          ),
          ListTile(
            title: Text('Portfolio', style: AppTextStyle.bodyLarge),
            onTap: () {
              Navigator.pop(context);
              onPortfolioTap?.call();
            },
          ),
          ListTile(
            title: Text('Contact', style: AppTextStyle.bodyLarge),
            onTap: () {
              Navigator.pop(context);
              onContactTap?.call();
            },
          ),
        ],
      ),
    );
  }
}
