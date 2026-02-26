import 'package:infobluera/src/common_widgets/glass_container.dart';
import 'package:infobluera/src/common_widgets/responsive_wrapper.dart';
import 'package:infobluera/src/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveWrapper.isMobile(context);
    return Container(
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 24 : 100,
        horizontal: 24,
      ),
      child: ResponsiveWrapper(
        child: Column(
          children: [
            Text(
              'Who We Are',
              style: AppTextStyle.caption.copyWith(
                color: AppColours.accent,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
            ).animate().fadeIn().slideY(begin: 0.1),
            const SizedBox(height: 8),
            Text(
              'About Us',
              style: isMobile
                  ? AppTextStyle.h2.copyWith(fontSize: 24)
                  : AppTextStyle.h2,
              textAlign: TextAlign.center,
            ).animate().fadeIn(delay: 100.ms).slideY(begin: 0.1),
            SizedBox(height: isMobile ? 16 : 48),
            LayoutBuilder(
              builder: (context, constraints) {
                final isMobile = constraints.maxWidth < 800;

                return isMobile
                    ? _buildMobileLayout(context,)
                    : _buildDesktopLayout(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      children: [
        _buildContentCard(context),
        const SizedBox(height: 32),
        _buildValues(), // Replaced stats with values
      ],
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(flex: 3, child: _buildContentCard(context)),
          const SizedBox(width: 48), // Increased spacing
          Expanded(
            flex: 2,
            child: _buildValues(),
          ), // Replaced stats with values
        ],
      ),
    );
  }

  Widget _buildContentCard(BuildContext context) {
    final isMobile = ResponsiveWrapper.isMobile(context);
    return GlassContainer(
      padding: const EdgeInsets.all(16), // Increased padding
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(
          //   'Innovating for the Future',
          //   style: isMobile
          //       ? AppTextStyle.h3.copyWith(fontSize: 18)
          //       : AppTextStyle.h3.copyWith(fontSize: 28),
          // ),
          // SizedBox(height: isMobile ? 16 : 24),
          // Text(
          //   'We are a passionate and experienced software development team dedicated to building scalable, secure, and high-performance digital products.',
          //   style: isMobile
          //       ? AppTextStyle.bodyLarge.copyWith(height: 1.8, fontSize: 14)
          //       : AppTextStyle.bodyLarge.copyWith(height: 1.8),
          //   textAlign: TextAlign.justify,
          // ),
          // SizedBox(height: isMobile ? 16 : 24),
          // Text(
          //   'From startup MVPs to enterprise-level platforms, we partner with businesses to transform ideas into reliable, user-friendly technology solutions that drive real growth.',
          //   style: isMobile
          //       ? AppTextStyle.body.copyWith(height: 1.8, fontSize: 14)
          //       : AppTextStyle.body.copyWith(height: 1.8),
          //   textAlign: TextAlign.justify,
          // ),
          Text(
            'We are a passionate and experienced software development company committed to delivering innovative, scalable, and high-performance digital solutions that empower businesses to grow and succeed in today’s competitive digital landscape. Our team of expert software engineers, UI/UX designers, and technology specialists focuses on building custom software, modern web applications, and powerful mobile apps tailored to meet the unique needs of startups, small businesses, and enterprise organizations. By leveraging the latest technologies, cloud infrastructure, and modern development frameworks, we create secure, fast, and reliable solutions that improve operational efficiency, enhance customer engagement, and strengthen digital presence.',
            style: isMobile
                ? AppTextStyle.bodyLarge.copyWith(height: 1.9, fontSize: 14)
                : AppTextStyle.bodyLarge.copyWith(height: 1.9),
            textAlign: TextAlign.justify,
          ),

          SizedBox(height: isMobile ? 16 : 24),

          Text(
            'Our expertise includes custom web development, mobile app development for Android and iOS, SaaS platform development, enterprise software engineering, and cloud-based application development. We design and develop responsive, SEO-optimized, and performance-driven digital products that deliver exceptional user experiences across all devices. From intuitive user interfaces to robust backend systems, we ensure every solution is built with scalability, security, and long-term sustainability in mind. Our development process follows industry best practices, agile methodologies, and modern architecture standards to ensure faster delivery, higher quality, and maximum business value.',
            style: isMobile
                ? AppTextStyle.body.copyWith(height: 1.9, fontSize: 14)
                : AppTextStyle.body.copyWith(height: 1.9),
            textAlign: TextAlign.justify,
          ),

          SizedBox(height: isMobile ? 16 : 24),

          Text(
            'We partner with startups to transform innovative ideas into successful MVPs and help enterprises modernize legacy systems with advanced, scalable, and cloud-ready solutions. Our services include full-stack development, API development and integration, database design, enterprise system integration, SaaS product development, and digital transformation services. We focus on building solutions that increase productivity, streamline workflows, reduce operational costs, and accelerate business growth. Our mission is to deliver reliable, future-ready technology solutions that enable businesses to innovate faster, scale efficiently, and stay ahead in an ever-evolving digital world.',
            style: isMobile
                ? AppTextStyle.body.copyWith(height: 1.9, fontSize: 14)
                : AppTextStyle.body.copyWith(height: 1.9),
            textAlign: TextAlign.justify,
          ),

          SizedBox(height: isMobile ? 16 : 24),

          Text(
            'At InfoBluera, we are dedicated to providing end-to-end software development services, from initial concept and UI/UX design to development, testing, deployment, and ongoing support. We prioritize performance, security, and scalability in every project we deliver. Our goal is to help businesses build powerful digital products, improve online visibility, enhance customer satisfaction, and achieve sustainable long-term success through innovative, reliable, and cutting-edge technology solutions. Trusted by growing businesses and industry leaders, we continue to deliver technology that drives measurable results and real business impact.',
            style: isMobile
                ? AppTextStyle.body.copyWith(height: 1.9, fontSize: 14)
                : AppTextStyle.body.copyWith(height: 1.9),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    ).animate().fadeIn(delay: 200.ms).slideX(begin: -0.1);
  }

  Widget _buildValues() {
    // New implementation for Core Values
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildValueItem(
          icon: Icons.rocket_launch,
          title: 'High Performance',
          subtitle: 'Optimized for speed and efficiency.',
          delay: 300,
        ),
        const SizedBox(height: 16),
        _buildValueItem(
          icon: Icons.security,
          title: 'Secure & Reliable',
          subtitle: 'Bank-grade security standards.',
          delay: 400,
        ),
        const SizedBox(height: 16),
        _buildValueItem(
          icon: Icons.layers,
          title: 'Scalable Architecture',
          subtitle: 'Built to grow with your business.',
          delay: 500,
        ),
      ],
    );
  }

  Widget _buildValueItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required int delay,

  }) {
    return GlassContainer(
      padding: const EdgeInsets.all(24),
      color: AppColours.primary.withValues(alpha: 0.05),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColours.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColours.primaryLight, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTextStyle.bodyLarge.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColours.textPrimary,
                    fontSize: 15
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTextStyle.caption.copyWith(fontSize: 13),
                ),
              ],
            ),
          ),
        ],
      ),
    ).animate().fadeIn(delay: delay.ms).slideX(begin: 0.1);
  }
}
