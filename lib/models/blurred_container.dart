import 'dart:ui' as ui;
import 'package:flutter/material.dart';

class BlurredContainer extends StatelessWidget {
  final double left;
  final double top;
  final double width;
  final double height;

  const BlurredContainer({
    Key? key,
    required this.left,
    required this.top,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      top: top,
      child: ClipRRect(
        child: BackdropFilter(
          filter: ui.ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Colors.red,
                  Colors.red.withOpacity(0.5),
                  Colors.red.withOpacity(0.1),
                ],
                radius: 0.5,
                center: Alignment.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
