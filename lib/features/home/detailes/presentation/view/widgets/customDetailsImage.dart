import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';

class Customdetailsimage extends StatelessWidget {
  const Customdetailsimage({super.key, required this.url, required this.name});
  final String url;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          width: 350,
          height: 255,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                spreadRadius: 0.9,
                blurRadius: 6,
                color: Colors.black26,
                blurStyle: BlurStyle.outer,
              ),
            ],
            borderRadius: BorderRadiusDirectional.circular(90),
            image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(url)),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: Get.size.width / 1.8,
              child: Text('$name', style: Fontstyle.f20w600w, maxLines: 3),
            ),
          ],
        ),
      ],
    );
  }
}
