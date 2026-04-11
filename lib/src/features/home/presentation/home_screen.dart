import 'package:infobluera/src/constants/app_constants.dart';
import 'package:infobluera/src/features/home/presentation/widgets/about_us_section.dart';
import 'package:infobluera/src/features/home/presentation/widgets/footer_section.dart';
import 'package:infobluera/src/features/home/presentation/widgets/hero_section.dart';
import 'package:infobluera/src/features/home/presentation/widgets/mobile_drawer.dart';
import 'package:infobluera/src/features/home/presentation/widgets/nav_bar.dart';
import 'package:infobluera/src/features/home/presentation/widgets/portfolio_section.dart';
import 'package:infobluera/src/features/home/presentation/widgets/services_section.dart';
import 'package:infobluera/src/features/home/presentation/widgets/team_section.dart';
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColours.background,
        endDrawer: MobileDrawer(
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
                  HeroSection(
                    key: _homeKey,
                    onPortfolioTap: () => _scrollToSection(_portfolioKey),
                    onContactTap: () => _scrollToSection(_contactKey),
                  ),
                  AboutUsSection(key: _aboutKey),
                  ServicesSection(key: _servicesKey),
                  PortfolioSection(key: _portfolioKey),
                  TeamSection(),
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
      ),
    );
  }
}
