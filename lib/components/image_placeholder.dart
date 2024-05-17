import 'package:flutter/material.dart';
import 'dart:math';

import 'package:flutter/cupertino.dart';


import '../utils/constants.dart';

class ImagePlaceholder extends StatelessWidget {
  const ImagePlaceholder(
      {super.key,
      this.height,
      this.width,
      this.alignment,
      this.padding,
      this.margin,
      this.animationDuration,
      this.color,
      this.shape,
      this.borderRadius,
      this.border,
      this.boxShadow,
      this.gradient,
      this.child});
  final double? height;
  final double? width;
  final AlignmentGeometry? alignment;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Duration? animationDuration;
  final Color? color;

  final BoxShape? shape;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;
  final List<BoxShadow>? boxShadow;
  final Gradient? gradient;

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: height,
      duration: animationDuration ?? const Duration(milliseconds: 500),
      width: width,
      decoration: BoxDecoration(
        color:
            color ?? lightColors[Random.secure().nextInt(lightColors.length)],
        shape: shape ?? BoxShape.rectangle,
        borderRadius: borderRadius,
        border: border,
        boxShadow: boxShadow,
        gradient: gradient,
      ),
      alignment: alignment,
      padding: padding,
      margin: margin,
      child: child,
    );
  }
}