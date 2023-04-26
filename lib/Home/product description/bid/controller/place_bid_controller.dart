import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PlaceBidController extends GetxController {
  GlobalKey<FormState> bidKey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();

  RxInt askBid = 10.obs;
  RxInt yourBid = 10.obs;

  increaseAsk() {
    askBid.value = askBid.value + 10;
  }

  decreaseAsk() {
    if (askBid.value > 0) askBid.value = askBid.value - 10;
  }

  increaseYourBid() {
    yourBid.value = yourBid.value + 10;
  }

  decreaseYourBid() {
    if (yourBid.value > 0) yourBid.value = yourBid.value - 10;
  }

  RxList nameList = ["Aman", "Akash", "Raghav", "Ravi", "Vijay", "Mohit"].obs;
  RxList askList = ["23", "45", "09", "120", "121", "50"].obs;
  RxList yourBidList = ["23", "45", "09", "120", "121", "50"].obs;

  String? nameValidator(value) {
    if (value == '') {
      return 'Enter your name';
    } else {
      return null;
    }
  }

  checkBid() {
    final validator = bidKey.currentState!.validate();
    if (!validator) {
      return;
    } else {
      Get.back();
    }
  }
}
