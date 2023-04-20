import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  TextEditingController search = TextEditingController();
  RxString searchResult = ''.obs;

  searchItem(value) {
    if (value != '') {
      searchResult.value = search.text;
    }
  }
}
