import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/utiles/localization/lang_keys.dart';
import 'package:resturant_app/core/widgets/gradientText.dart';
import 'package:resturant_app/core/widgets/linearButton.dart';
import 'package:resturant_app/features/auth/forgetPass/data/sendOTP.dart';

class Otpverification extends StatefulWidget {
  const Otpverification({super.key, required this.otp, required this.email});
  final int otp;
  final String email;

  @override
  State<Otpverification> createState() => _OtpverificationState();
}

class _OtpverificationState extends State<Otpverification> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 130.h),
            Text(LangKeys.vervication.tr, style: Fontstyle.f30w600),
            SizedBox(height: 20.h),
            Text(LangKeys.enter4Dig.tr, style: Fontstyle.f15w400w),
            SizedBox(height: 20.h),
            PinCodeTextField(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              appContext: context,
              length: 4,
              controller: otpController,
              hintCharacter: 'o',
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(30),
                fieldHeight: 50,
                fieldWidth: 55,
                activeFillColor: Colors.white,
                inactiveColor: Colors.grey,
                selectedColor: Colors.blue,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(LangKeys.didntRecive.tr, style: Fontstyle.f15w400w),
                TextButton(
                  onPressed: () async {
                    Helper.customeLoadingSnac(title: LangKeys.resendOtp.tr);

                    await Sendotp().sendEmailWithSendGrid(
                      widget.otp,
                      email: widget.email,
                    );
                  },
                  child: GradientText(
                    style: Fontstyle.f15w400w,
                    text: LangKeys.resendOtp.tr,
                    gradient: const LinearGradient(
                      colors: [Colors.tealAccent, Colors.blueAccent],
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),

            Linearbutton(
              title: LangKeys.continu.tr,
              w: double.infinity,
              h: 60,
              onTap: () {
                if (otpController.text == widget.otp.toString()) {
                  log('message');
                } else {
                  Helper.FlutterToast(
                    title: 'Wrong Otp Please Try Again',
                    success: false,
                  );
                }
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
