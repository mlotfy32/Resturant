import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';
import 'package:resturant_app/core/utiles/localization/lang_keys.dart';
import 'package:resturant_app/core/widgets/gradientText.dart';
import 'package:resturant_app/core/widgets/linearButton.dart';
import 'package:resturant_app/features/auth/login/presentation/cubit/checkbox_cubit.dart';
import 'package:resturant_app/features/auth/login/presentation/cubit/loginb/loginb_cubit.dart';
import 'package:resturant_app/features/auth/login/presentation/view/widgets/createAcc.dart';
import 'package:resturant_app/features/auth/login/presentation/view/widgets/customLogInForm.dart';
import 'package:resturant_app/features/auth/login/presentation/view/widgets/orSignin.dart';
import 'package:resturant_app/features/auth/login/presentation/view/widgets/rememberRow.dart';
import 'package:resturant_app/features/auth/login/presentation/view/widgets/signInButtons.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(child: SizedBox(height: 130.h)),
            SliverToBoxAdapter(
              child: Text(LangKeys.signIn.tr, style: Fontstyle.f30w600),
            ),
            SliverToBoxAdapter(
              child: BlocProvider<LoginbCubit>(
                create: (context) => LoginbCubit(),
                child: const CustomLoginForm(),
              ),
            ),

            // SliverToBoxAdapter(
            //   child: BlocProvider<CheckboxCubit>(
            //     create: (context) => CheckboxCubit(),
            //     child: const RememberRow(),
            //   ),
            // ),
            const SliverToBoxAdapter(child: Createacc()),

            const SliverToBoxAdapter(child: Orsignin()),
            const SliverToBoxAdapter(child: SigninButtons()),
          ],
        ),
      ),
    );
  }
}
