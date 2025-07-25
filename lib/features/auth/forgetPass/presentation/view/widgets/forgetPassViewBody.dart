import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/utiles/localization/lang_keys.dart';
import 'package:resturant_app/core/widgets/3.3%20custom_text_field.dart';
import 'package:resturant_app/core/widgets/linearButton.dart';
import 'package:resturant_app/features/auth/forgetPass/data/sendOTP.dart';

class Forgetpassviewbody extends StatefulWidget {
  const Forgetpassviewbody({super.key});

  @override
  State<Forgetpassviewbody> createState() => _ForgetpassviewbodyState();
}

class _ForgetpassviewbodyState extends State<Forgetpassviewbody> {
  TextEditingController email = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 130.h)),
            SliverToBoxAdapter(
              child: Text(LangKeys.forgetPassword.tr, style: Fontstyle.f30w600),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 30.h)),

            SliverToBoxAdapter(
              child: Text(LangKeys.enterEmail.tr, style: Fontstyle.f15w400w),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 30.h)),
            SliverToBoxAdapter(
              child: Text(LangKeys.email.tr, style: Fontstyle.f15w400w),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 8.h)),
            SliverToBoxAdapter(
              child: Form(
                key: formKey,
                child: CustomTextField(
                  color: Colors.white24,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return LangKeys.requiredEmail.tr;
                    } else if (value!.contains('@gmail.com') == false) {
                      return LangKeys.validEmail.tr;
                    }
                  },
                  controller: email,
                  hintText: 'example@gmail.com',
                ),
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: Get.size.height / 4)),
            SliverToBoxAdapter(
              child: Linearbutton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    int otp = Sendotp().generateRandomNumber(4);
                    Sendotp().sendEmailWithSendGrid(0, email: email.text);
                  }
                },
                title: LangKeys.continu,
                w: double.infinity,
                h: 60,
              ),
            ),
            SliverToBoxAdapter(child: SizedBox(height: 30.h)),
          ],
        ),
      ),
    );
  }
}
