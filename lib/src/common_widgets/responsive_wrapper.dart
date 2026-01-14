import 'package:flutter/material.dart';
import 'package:code_line/src/constants/app_constants.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget child;
  final bool constrainConfig; // If true, applies max-width constraints

  const ResponsiveWrapper({
    Key? key,
    required this.child,
    this.constrainConfig = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (!constrainConfig) return child;

        double maxWidth = AppBreakpoints.laptop;

        if (constraints.maxWidth >= AppBreakpoints.tv) {
          maxWidth = 1600; // Wider content on 4K/TVs
        }

        return Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: maxWidth),
            child: child,
          ),
        );
      },
    );
  }
}
