import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      height: Get.size.height - 200,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      child: ListView(children: [Text(text, style: Fontstyle.f15w400w)]),
    );
  }
}
