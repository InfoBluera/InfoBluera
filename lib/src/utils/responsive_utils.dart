import 'package:flutter/material.dart';
import 'package:infobluera/src/constants/app_constants.dart';

class Responsive extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;
  final Widget? tv;

  const Responsive({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
    this.tv,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppBreakpoints.mobile;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppBreakpoints.mobile &&
      MediaQuery.of(context).size.width < AppBreakpoints.tablet;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppBreakpoints.tablet &&
      MediaQuery.of(context).size.width < AppBreakpoints.laptop;

  static bool isTV(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppBreakpoints.laptop;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= AppBreakpoints.laptop) {
      // Prioritize TV widget if available, else desktop, else tablet, else mobile
      return tv ?? desktop ?? tablet ?? mobile;
    } else if (size.width >= AppBreakpoints.tablet) {
      return desktop ?? tablet ?? mobile;
    } else if (size.width >= AppBreakpoints.mobile) {
      return tablet ?? mobile;
    } else {
      return mobile;
    }
  }
}
