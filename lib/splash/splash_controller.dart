import 'dart:async';

import 'package:demo/login/login_screen.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    Timer(
      const Duration(seconds: 3),
      () => Get.off(() => LoginScreen()),
    );
    super.onReady();
  }
}
