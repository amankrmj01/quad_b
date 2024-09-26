import 'package:flutter/material.dart';
import 'dart:math' as Math;

class RatingStar extends StatelessWidget {
  final double rating; // Rating value between 0 and 1

  const RatingStar({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: StarClipper(),
          child: Container(
            width: 24,
            height: 24,
            color: Colors.amber.withOpacity(0.3), // Background star color
          ),
        ),
        ClipPath(
          clipper: StarClipper(),
          child: Container(
            width: 24 * rating,
            height: 24,
            color: Colors.amber, // Foreground star color
          ),
        ),
      ],
    );
  }
}

class StarClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final double width = size.width;
    final double height = size.height;
    final double halfWidth = width / 2;
    final double halfHeight = height / 2;
    final double radius = halfWidth;

    path.moveTo(halfWidth, 0);
    for (int i = 1; i < 5; i++) {
      double x = halfWidth + radius * Math.cos(i * 2 * Math.pi / 5);
      double y = halfHeight + radius * Math.sin(i * 2 * Math.pi / 5);
      path.lineTo(x, y);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
