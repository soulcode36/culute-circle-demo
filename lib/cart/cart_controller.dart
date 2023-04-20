import 'package:get/get.dart';

class CartController extends GetxController {
  RxList imgeList = [].obs;
  RxList titleList = [].obs;
  RxList priceList = [].obs;

  addToCart(String image, String title, int price) {
    imgeList.add(image);
    titleList.add(title);
    priceList.add(price);

    print(imgeList);
  }
}
