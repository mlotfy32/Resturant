import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/app/appImages.dart';
import 'package:resturant_app/core/utiles/localization/lang_keys.dart';
import 'package:resturant_app/features/auth/login/data/signIn_Facebook.dart';
import 'package:resturant_app/features/auth/login/data/signIn_Google.dart';
import 'package:resturant_app/features/auth/login/presentation/view/widgets/authButton.dart';

class SigninButtons extends StatelessWidget {
  const SigninButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          AuthButton(
            title: authTitle[0].tr,
            image: Appimages.authImages[0],
            onTap: () => SigninWithFacebook().signInWithFacebook(),
          ),
          AuthButton(
            title: authTitle[1].tr,
            image: Appimages.authImages[1],
            onTap: () => SigninWitgGoogle().signInWithGoogle(),
          ),
        ],
      ),
    );
  }
}

const List<String> authTitle = [LangKeys.facebook, LangKeys.google];
