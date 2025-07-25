import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/widgets/linearButton.dart';
import 'package:resturant_app/features/auth/SignUp/presentation/view/widgets/customeeSignUpForm.dart';
import 'package:resturant_app/features/auth/SignUp/presentation/viewModel/passwordvisability/passwordvisability_cubit.dart';
import 'package:resturant_app/features/auth/SignUp/presentation/viewModel/signup_cubit.dart';

class Createacc extends StatelessWidget {
  const Createacc({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.off(
          () => MultiBlocProvider(
            providers: [
              BlocProvider<PasswordvisabilityCubit>(
                create: (context) => PasswordvisabilityCubit(),
              ),
              BlocProvider<SignupCubit>(create: (context) => SignupCubit()),
            ],
            child: Customeesignupform(),
          ),
        );
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
              'Create Account',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.white, // مهم عشان يبان التدرج
              ),
            ),
          ),
        ),
      ),
    );
  }
}
