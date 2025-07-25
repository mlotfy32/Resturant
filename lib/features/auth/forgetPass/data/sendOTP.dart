import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/utiles/localization/lang_keys.dart';
import 'package:resturant_app/features/auth/forgetPass/presentation/view/widgets/otpVerification.dart';

class Sendotp {
  factory Sendotp() {
    return _otp;
  }
  Sendotp._internal();
  static final Sendotp _otp = Sendotp._internal();

  final apiKey = dotenv.env['EMAIL_API_Key'];
  final emailURL = dotenv.env['EMAIL_URL'];

  Future<int> sendEmailWithSendGrid(int random, {required String email}) async {
    final url = Uri.parse(emailURL!);
    int randomNumber = generateRandomNumber(4);
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer ${apiKey}',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'personalizations': [
          {
            'to': [
              {'email': '$email'},
            ],
          },
        ],
        'from': {'email': 'mhmdlotfy12200@gmail.com'},
        'subject': 'OTP',
        'content': [
          {
            'type': 'text/plain',
            'value':
                '${random == 0 ? randomNumber : random} : رقم التحقق الخاص بك هو ',
          },
        ],
      }),
    );

    if (response.statusCode == 202) {
      Helper.FlutterToast(title: LangKeys.otpSendSucc.tr, success: true);
      Get.to(() => Otpverification(otp: 0000, email: email));
    } else {
      Helper.FlutterToast(title: LangKeys.otpSendFail.tr, success: false);
    }
    return response.statusCode;
  }

  int generateRandomNumber(int numberOfDigits) {
    if (numberOfDigits < 1) {
      throw ArgumentError('Number of digits must be at least 1');
    }

    Random random = Random();
    int min = pow(10, numberOfDigits - 1).toInt();
    int max = pow(10, numberOfDigits).toInt() - 1;

    return min + random.nextInt(max - min + 1);
  }
}
