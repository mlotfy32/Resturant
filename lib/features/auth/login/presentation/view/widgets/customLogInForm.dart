import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/utiles/localization/lang_keys.dart';
import 'package:resturant_app/core/widgets/3.3%20custom_text_field.dart';
import 'package:resturant_app/core/widgets/linearButton.dart';
import 'package:resturant_app/features/auth/login/presentation/cubit/loginb/loginb_cubit.dart';
import 'package:resturant_app/features/home/presentation/view/homeView.dart';

class CustomLoginForm extends StatefulWidget {
  const CustomLoginForm({super.key});

  @override
  State<CustomLoginForm> createState() => _CustomLoginFormState();
}

class _CustomLoginFormState extends State<CustomLoginForm> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  final key = GlobalKey<FormState>();
  @override
  void dispose() {
    email.dispose();
    pass.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginbCubit, LoginbState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          Helper.FlutterToast(title: 'Success Login.', success: true);
          Get.offAll(() => const HomeView());
        } else if (state is LoginFailure) {
          Helper.FlutterToast(title: state.error, success: false);
        } else {
          Helper.FlutterToast(title: 'Loading...', success: true);
        }
      },
      child: Form(
        key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Text(LangKeys.email.tr, style: Fontstyle.f15w400w),
            const SizedBox(height: 8),
            CustomTextField(
              color: Colors.white24,
              controller: email,
              keyboardType: TextInputType.emailAddress,
              hintText: 'example@gmail.com',
              validator: (value) {
                if (value!.isEmpty) {
                  return LangKeys.requiredEmail.tr;
                } else if (value!.contains('@gmail.com') == false) {
                  return LangKeys.validEmail.tr;
                }
              },
            ),
            const SizedBox(height: 15),
            Text(LangKeys.pass.tr, style: Fontstyle.f15w400w),
            const SizedBox(height: 8),
            CustomTextField(
              color: Colors.white24,
              controller: pass,
              obscureText: true,
              hintText: '•••••••••••••',
              validator: (value) {
                if (value!.isEmpty) {
                  return LangKeys.requiredpass.tr;
                } else if (value.length < 8) {
                  return LangKeys.validPass.tr;
                }
              },
              suffixIcon: IconButton(
                onPressed: () {},
                icon: const Icon(FontAwesomeIcons.eye, color: Colors.grey),
              ),
            ),
            Linearbutton(
              //TODO: Sign In Imple
              onTap: () {
                if (key.currentState!.validate()) {
                  BlocProvider.of<LoginbCubit>(
                    context,
                  ).login(pass: pass.text, email: email.text);
                }
              },
              title: LangKeys.signIn,
              w: double.infinity,
              h: 60,
            ),
          ],
        ),
      ),
    );
  }
}
