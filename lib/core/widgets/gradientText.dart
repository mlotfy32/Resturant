import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class GradientText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Gradient gradient;

  const GradientText({required this.text, required this.gradient, this.style});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback:
          (bounds) => gradient.createShader(
            Rect.fromLTWH(0, 0, bounds.width, bounds.height),
          ),
      child: Text(
        text.tr,
        style: (style ?? const TextStyle()).copyWith(color: Colors.white),
      ),
    );
  }
}
