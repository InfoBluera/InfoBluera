import 'package:flutter/material.dart';
import 'package:infobluera/src/constants/app_constants.dart';
import 'package:infobluera/src/common_widgets/responsive_wrapper.dart';
import 'package:infobluera/src/common_widgets/gradient_button.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback? onPortfolioTap;
  final VoidCallback? onContactTap;
  const HeroSection({
    super.key,
    required this.onPortfolioTap,
    required this.onContactTap,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < AppBreakpoints.tablet;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            'https://images.unsplash.com/photo-1451187580459-43490279c0fa?q=80&w=2072&auto=format&fit=crop',
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColours.background.withValues(alpha: 0.9),
                  AppColours.background.withValues(alpha: 0.7),
                  AppColours.background,
                ],
              ),
            ),
          ),
        ),

        // Content
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: isMobile ? 80 : 140,
            horizontal: 24,
          ),
          child: ResponsiveWrapper(
            child: Column(
              children: [
                if (!isMobile)
                  Row(
                    children: [
                      Expanded(flex: 5, child: _buildContent(context)),
                      // const SizedBox(width: 60),
                      // Expanded(flex: 4, child: _build3DElement()),
                    ],
                  )
                else
                  Column(
                    children: [
                      _buildContent(context),
                      // const SizedBox(height: 60),
                      // _build3DElement(),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    final isMobile = ResponsiveWrapper.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColours.primary.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColours.primary.withValues(alpha: 0.3),
            ),
            boxShadow: [
              BoxShadow(
                color: AppColours.primary.withValues(alpha: 0.1),
                blurRadius: 20,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.stars, color: AppColours.accent, size: 16)
                  .animate(onPlay: (c) => c.repeat())
                  .shimmer(duration: 2.seconds, delay: 3.seconds),
              const SizedBox(width: 8),
              Text(
                'PREMIUM IT SOLUTIONS',
                style: AppTextStyle.caption.copyWith(
                  color: AppColours.primaryLight,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.4,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
        const SizedBox(height: 32),
        RichText(
          text: TextSpan(
            style: isMobile
                ? AppTextStyle.h1.copyWith(height: 1.2, fontSize: 24)
                : AppTextStyle.h1.copyWith(height: 1.2),
            children: [
              const TextSpan(
                text: 'Building the\n',
                style: TextStyle(letterSpacing: 0.8, wordSpacing: 0.4),
              ),
              TextSpan(
                text: 'Digital Future',
                style: TextStyle(
                  foreground: Paint()
                    ..shader = AppColours.primaryGradient.createShader(
                      const Rect.fromLTWH(0.0, 0.0, 300.0, 70.0),
                    ),
                  letterSpacing: 0.8,
                  wordSpacing: 0.4,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 800.ms).slideY(begin: 0.2),
        const SizedBox(height: 24),
        Text(
          'We design and develop high-performance, scalable websites, mobile applications, and enterprise software solutions that accelerate business growth and digital transformation. Our expert team specializes in custom web development, mobile app development, and enterprise software engineering using modern technologies to deliver secure, fast, and user-centric digital products. Trusted by industry leaders worldwide, we help businesses improve efficiency, enhance user experience, increase online visibility, and achieve measurable results through innovative, reliable, and future-ready technology solutions.',
          style: AppTextStyle.bodyLarge.copyWith(
            color: AppColours.textSecondary,
            fontSize: isMobile ? 14 : 18,
          ),
          textAlign: TextAlign.justify,
        ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),
        const SizedBox(height: 48),
        isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GradientButton(
                        text: 'Start Your Projects',
                        onPressed: () {
                          onContactTap?.call();
                        },
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      )
                      .animate()
                      .scale(
                        delay: 600.ms,
                        duration: 400.ms,
                        curve: Curves.easeOutBack,
                      )
                      .shimmer(delay: 1000.ms, duration: 1500.ms),
                  const SizedBox(height: 14),
                  _GlassButton(
                    text: 'View Portfolio',
                    onPressed: () {
                      onPortfolioTap?.call();
                    },
                  ).animate().scale(
                    delay: 700.ms,
                    duration: 400.ms,
                    curve: Curves.easeOutBack,
                  ),
                ],
              )
            : Row(
                children: [
                  GradientButton(
                        text: 'Start Your Projects',
                        onPressed: () {
                          Navigator.pop(context);
                          onContactTap?.call();
                        },
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      )
                      .animate()
                      .scale(
                        delay: 600.ms,
                        duration: 400.ms,
                        curve: Curves.easeOutBack,
                      )
                      .shimmer(delay: 1000.ms, duration: 1500.ms),
                  const SizedBox(width: 24),
                  _GlassButton(
                    text: 'View Portfolio',
                    onPressed: () {
                      Navigator.pop(context);
                      onPortfolioTap?.call();
                    },
                  ).animate().scale(
                    delay: 700.ms,
                    duration: 400.ms,
                    curve: Curves.easeOutBack,
                  ),
                ],
              ),
      ],
    );
  }

}

class _GlassButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _GlassButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColours.textSecondary.withValues(alpha: 0.3),
          ),
          color: Colors.white.withValues(alpha: 0.05),
        ),
        child: Center(
          child: Text(
            text,
            style: AppTextStyle.button.copyWith(color: AppColours.textPrimary),
          ),
        ),
      ),
    );
  }
}
