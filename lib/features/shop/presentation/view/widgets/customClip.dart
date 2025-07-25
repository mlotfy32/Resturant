import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CurvedBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TopNotchClipper(),
      child: Container(
        color: Colors.white,

        height: Get.size.height / 2,
        width: Get.size.width,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Denny's",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 4),
            Text(
              "Breakfast, lunch, and...",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

class TopNotchClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(0, 20);

    final notchRadius = -70.0;
    final notchWidth = 120.0;

    final notchStartX = (size.width - notchWidth) / 2;
    final notchEndX = notchStartX + notchWidth;

    path.lineTo(notchStartX, 20);

    path.quadraticBezierTo(
      notchStartX + notchWidth / 2,
      -notchRadius,
      notchEndX,
      20,
    );

    path.lineTo(size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
