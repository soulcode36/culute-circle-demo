import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final PageController pageController = PageController(initialPage: 0);
  RxInt currentPage = 0.obs;
  onPageChnaged(int index) {
    currentPage.value = index;
  }
}
