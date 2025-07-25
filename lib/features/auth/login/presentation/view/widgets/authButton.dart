import 'package:flutter/material.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.title,
    required this.image,
    this.onTap,
  });
  final String title;
  final String image;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [Colors.tealAccent, Colors.blueAccent],
          ),
        ),
        width: 150,
        height: 55,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(image, fit: BoxFit.cover, width: 40, height: 40),
            Text(title, style: Fontstyle.f15w400w.copyWith(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
