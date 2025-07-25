import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:resturant_app/core/styles/fonts/fontStyle.dart';

class Helper {
  factory Helper() {
    return _help;
  }
  Helper._internal();
  static final Helper _help = Helper._internal();

  static FlutterToast({required String title, required bool success}) {
    Fluttertoast.showToast(
      msg: title.tr,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 2,
      backgroundColor: success == false ? Colors.red : Colors.greenAccent,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  static void customeLoadingSnac({required String title}) {
    Get.snackbar(
      'Resturant',
      title,
      duration: const Duration(seconds: 1),
      titleText: Text('Resturant', style: Fontstyle.f20w600w),
      messageText: Text(
        title,
        // style: AppFonts.f19w500,
      ),
      snackPosition: SnackPosition.BOTTOM,
      showProgressIndicator: true,
    );
  }

  static customeLoadingwidget({required double size}) {
    return Get.dialog(
      Center(child: SpinKitFadingCircle(color: Colors.blue, size: size)),
    );
  }
}

extension Navigation on BuildContext {
  void getNavigateTo({required Widget child}) {
    Get.to(() => child, transition: Transition.fade, curve: Curves.easeInCirc);
  }

  void getNavigateOff({required Widget child}) {
    Get.off(() => child, transition: Transition.fade, curve: Curves.easeInCirc);
  }

  void getNavigateBack() {
    Get.back();
  }
}

//TODO:Edit Helper




  // static customeDialog({
  //   required String left,
  //   required String right,
  //   required void onTap(),
  // }) {
  //   Get.defaultDialog(
  //     title: 'Confirm log out !',
  //     middleText: '',
  //     // titleStyle: AppFonts.f19w500.copyWith(color: Colors.black),
  //     cancel: TextButton(
  //       onPressed: () => Get.back(),
  //       child: Text(
  //         left,
  //         // style: AppFonts.f19w500.copyWith(color: Colors.red),
  //       ),
  //     ),
  //     confirm: TextButton(
  //       onPressed: onTap,
  //       child: Text(
  //         right,
  //         // style: AppFonts.f19w500.copyWith(color: Colors.green)
  //       ),
  //     ),
  //   );
  // }



