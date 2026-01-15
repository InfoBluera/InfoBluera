import 'package:flutter/material.dart';
import 'package:code_line/src/constants/app_constants.dart';
import 'package:code_line/src/common_widgets/responsive_wrapper.dart';
import 'package:code_line/src/common_widgets/gradient_button.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:ui';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < AppBreakpoints.tablet;

    return Stack(
      children: [
        // Background Image with Gradient Overlay
        // Background Image with Gradient Overlay
        Positioned.fill(
          child:
              Image.network(
                    'https://images.unsplash.com/photo-1451187580459-43490279c0fa?q=80&w=2072&auto=format&fit=crop',
                    fit: BoxFit.cover,
                  )
                  .animate(
                    onPlay: (controller) => controller.repeat(reverse: true),
                  )
                  .scale(
                    begin: const Offset(1.0, 1.0),
                    end: const Offset(1.1, 1.1),
                    duration: 10.seconds,
                    curve: Curves.easeInOut,
                  )
                  .fadeIn(duration: 1.seconds)
                  .saturate(begin: 0, end: 1, duration: 2.seconds),
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
                      const SizedBox(width: 60),
                      Expanded(flex: 4, child: _build3DElement()),
                    ],
                  )
                else
                  Column(
                    children: [
                      _buildContent(context),
                      const SizedBox(height: 60),
                      _build3DElement(),
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
        SizedBox(height: 20,),
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
                  letterSpacing: 1.5,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
        const SizedBox(height: 32),
        RichText(
          text: TextSpan(
            style: isMobile
                ? AppTextStyle.h1.copyWith(height: 1.1, fontSize: 32)
                : AppTextStyle.h1.copyWith(height: 1.1),
            children: [
              const TextSpan(text: 'Building the\n'),
              TextSpan(
                text: 'Digital Future',
                style: TextStyle(
                  foreground: Paint()
                    ..shader = AppColours.primaryGradient.createShader(
                      const Rect.fromLTWH(0.0, 0.0, 300.0, 70.0),
                    ),
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: 200.ms, duration: 800.ms).slideY(begin: 0.2),
        const SizedBox(height: 24),
        Text(
          'We craft high-performance websites, mobile apps, and enterprise software that drives growth. Trusted by industry leaders.',
          style: AppTextStyle.bodyLarge.copyWith(
            color: AppColours.textSecondary,
            fontSize: isMobile ? 14 : 18,
          ),
        ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.2),
        const SizedBox(height: 48),
        isMobile
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GradientButton(
                        text: 'Start Your Project',
                        onPressed: () {},
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
                  const SizedBox(height: 16),
                  _GlassButton(
                    text: 'View Portfolio',
                    onPressed: () {},
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
                        text: 'Start Your Project',
                        onPressed: () {},
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
                    onPressed: () {},
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

  Widget _build3DElement() {
    return SizedBox(
      height: 500,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Ambient Glow Pulse
          Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColours.primary.withValues(alpha: 0.2),
                  boxShadow: [
                    BoxShadow(
                      color: AppColours.primary.withValues(alpha: 0.3),
                      blurRadius: 60,
                      spreadRadius: 20,
                    ),
                  ],
                ),
              )
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .scale(
                begin: const Offset(1, 1),
                end: const Offset(1.5, 1.5),
                duration: 3.seconds,
                curve: Curves.easeInOut,
              )
              .fade(begin: 0.2, end: 0.6, duration: 3.seconds),

          // Main 3D Card
          ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    width: 350,
                    height: 220,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.1),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 30,
                          offset: const Offset(0, 20),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Icon(
                        Icons.code_off,
                        size: 80,
                        color: AppColours.primaryLight,
                      ),
                    ),
                  ),
                ),
              )
              .animate(onPlay: (c) => c.repeat(reverse: true))
              .moveY(
                begin: 0,
                end: -20,
                duration: 3.seconds,
                curve: Curves.easeInOut,
              ),
        ],
      ),
    );
  }
}

class _GlassButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const _GlassButton({super.key, required this.text, required this.onPressed});

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
        child: Text(
          text,
          style: AppTextStyle.button.copyWith(color: AppColours.textPrimary),
        ),
      ),
    );
  }
}
