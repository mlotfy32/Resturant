import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/themes/themes.dart';
import 'package:resturant_app/core/utiles/localization/local.dart';
import 'package:resturant_app/features/auth/login/presentation/view/loginView.dart';
import 'package:resturant_app/features/home/presentation/view/homeView.dart';
import 'package:resturant_app/features/home/presentation/view/widgets/homeViewBody.dart';

class Resturant extends StatelessWidget {
  const Resturant({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        translations: MyLocal(),
        locale: const Locale('en'),
        theme: Themes.lightTheme,
        debugShowCheckedModeBanner: false,
        home:
            // FirebaseAuth.instance.currentUser == null
            // ?
            const Loginview(),
        // : const HomeView(),
      ),
    );
  }
}
