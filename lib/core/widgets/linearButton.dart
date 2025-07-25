import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';

class Linearbutton extends StatelessWidget {
  const Linearbutton({
    super.key,
    required this.title,
    required this.w,
    required this.h,
    required this.onTap,
  });
  final String title;
  final double w;
  final double h;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        width: w,
        height: h,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: const LinearGradient(
            colors: [Colors.tealAccent, Colors.blueAccent],
          ),
        ),
        child: Text(title.tr, style: Fontstyle.f20w600w),
      ),
    );
  }
}
