import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';

class FreeText extends StatelessWidget {
  const FreeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Free Delivery',
          style: Fontstyle.f25w700w.copyWith(color: Colors.white),
          overflow: TextOverflow.clip,
        ),
        const SizedBox(height: 6),
        SizedBox(
          width: Get.size.width / 2,

          child: Text(
            'Get \$0 delivery lowwer fees, and 5% back on pickup',
            style: Fontstyle.f16w600.copyWith(color: Colors.white),
            overflow: TextOverflow.clip,
          ),
        ),
        const SizedBox(height: 6),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.orange),
          ),
          onPressed: () {},
          child: Text(
            'Order Now',
            style: Fontstyle.f16w600.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
