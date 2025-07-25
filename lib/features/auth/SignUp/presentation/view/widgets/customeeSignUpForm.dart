// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/widgets/3.3%20custom_text_field.dart';
import 'package:resturant_app/core/widgets/linearButton.dart';
import 'package:resturant_app/features/auth/SignUp/presentation/viewModel/signup_cubit.dart';
import 'package:resturant_app/features/auth/SignUp/presentation/viewModel/passwordvisability/passwordvisability_cubit.dart';
import 'package:resturant_app/features/auth/login/presentation/view/loginView.dart';

class Customeesignupform extends StatefulWidget {
  Customeesignupform({super.key});

  @override
  State<Customeesignupform> createState() => _CustomeesignupformState();
}

class _CustomeesignupformState extends State<Customeesignupform> {
  final formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isVisable = true;
    return BlocListener<SignupCubit, SignupState>(
      listener: (context, state) {
        if (state is SignupSuccess) {
          Helper.FlutterToast(title: 'Account Created.', success: true);
          Get.to(() => const Loginview());
        } else if (state is SignupFailure) {
          Helper.FlutterToast(title: state.error, success: false);
        } else {
          Helper.FlutterToast(title: 'Loading...', success: true);
        }
      },
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: ListView(
              children: [
                SizedBox(height: 150.h),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text('Create Account', style: Fontstyle.f30w600),
                ),
                SizedBox(height: 30.h),

                CustomTextField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Email is required';
                    } else if (value!.contains('@gmail.com') == false) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  controller: email,
                  hintText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  color: Colors.black,
                ),
                SizedBox(height: 20.h),
                BlocBuilder<PasswordvisabilityCubit, PasswordvisabilityState>(
                  builder: (context, state) {
                    isVisable =
                        state is Passwordvisability
                            ? state.isPasswordVisible
                            : isVisable;
                    return CustomTextField(
                      color: Colors.black,
                      controller: pass,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password is required';
                        } else if (value.length < 8) {
                          return 'Password can`t be less than 8 characters';
                        }
                        return null;
                      },
                      hintText: 'Password',
                      obscureText: isVisable,
                      suffixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<PasswordvisabilityCubit>(
                            context,
                          ).changeVisability();
                        },
                        icon: Icon(
                          size: 20,
                          state is Passwordvisability &&
                                  state.isPasswordVisible == false
                              ? FontAwesomeIcons.eyeSlash
                              : FontAwesomeIcons.eye,
                          color: const Color(0xff757575),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 15.h),
                // const Align(
                //     alignment: Alignment.centerLeft,
                //     child: const CustomeDropButton()),
                SizedBox(height: 10.h),
                BlocBuilder<SignupCubit, SignupState>(
                  builder: (context, state) {
                    return Linearbutton(
                      title: 'Sign Up',
                      w: double.infinity,
                      h: 60,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          BlocProvider.of<SignupCubit>(
                            context,
                          ).signUp(pass: pass.text, email: email.text);
                        }
                      },
                    );
                  },
                ),
                TextButton(
                  onPressed: () {
                    Get.off(() => const Loginview());
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: [Colors.tealAccent, Colors.blueAccent],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: const Text(
                          'Already have an account !',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white, // مهم عشان يبان التدرج
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
