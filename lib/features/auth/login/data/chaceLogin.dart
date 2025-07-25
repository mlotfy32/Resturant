import 'package:get/get.dart';
import 'package:resturant_app/core/utiles/helper.dart';
import 'package:resturant_app/core/utiles/shared_pref/prefs_Keys.dart';
import 'package:resturant_app/core/utiles/shared_pref/shared_pref.dart';
import 'package:resturant_app/features/home/presentation/view/homeView.dart';

class CachLogin {
  factory CachLogin() {
    return _instance;
  }
  CachLogin._internal();
  static final CachLogin _instance = CachLogin._internal();
  static chacheLogin({required String? accessToken}) async {
    await SharedPref.preferences.setString(PrefsKeys.accessToken, accessToken!);
    await SharedPref.preferences.setBoolean(PrefsKeys.isLogin, true);
    Get.back();
    Helper.FlutterToast(title: 'Success Login', success: true);
    Get.off(() => const HomeView());
  }
}
