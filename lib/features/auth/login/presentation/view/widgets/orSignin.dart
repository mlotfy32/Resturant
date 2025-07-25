import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/localization/lang_keys.dart';

class Orsignin extends StatelessWidget {
  const Orsignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: Get.size.width / 4,
            child: const Divider(color: Colors.white30),
          ),
          Text(
            '  ${LangKeys.orSignWith.tr}  ',
            style: Fontstyle.f20w600w.copyWith(
              fontWeight: FontWeight.w400,
              fontSize: 18,
            ),
          ),
          SizedBox(
            width: Get.size.width / 4,
            child: const Divider(color: Colors.white30),
          ),
        ],
      ),
    );
  }
}
