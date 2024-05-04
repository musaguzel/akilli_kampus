import 'package:akilli_kampus/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class CustomGradientBackground extends StatelessWidget {
  const CustomGradientBackground({Key? key, required this.child, this.color1, this.color2, this.begin, this.end, this.borderRadius}) : super(key: key);

  final Widget child;
  final Color? color1;
  final Color? color2;
  final Alignment? begin;
  final Alignment? end;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height,
      width: context.width,
      decoration:  BoxDecoration(
        borderRadius: borderRadius ?? BorderRadius.zero,
          gradient: LinearGradient(
              begin: begin ?? Alignment.topCenter,
              end: end ?? Alignment.bottomCenter,
              colors: [
                color1 ?? context.theme.colorScheme.primary,
                color2 ?? context.theme.colorScheme.secondary
              ],
              stops: const [
                0.2,
                1.0
              ])),
      child: child,
    );
  }
}
