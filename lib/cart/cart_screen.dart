import 'package:demo/cart/cart_controller.dart';
import 'package:demo/widgets/buttons.dart';
import 'package:demo/widgets/cart_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../theme/theme.dart';
import '../widgets/spaces.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.030,
                    horizontal: MediaQuery.of(context).size.height * 0.030),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          "Our Cart",
                          style: headline,
                        ),
                        const Spacer(),
                      ],
                    ),
                    Spaces(height: 0.030, width: 0),
                    Row(
                      children: [
                        Text(
                          "Items in your cart : ",
                          style: titleText,
                        ),
                        Spacer(),
                        Buttons(
                            height: 0.050,
                            width: 0.090,
                            radius: 100,
                            color: appTheme.buttonColor,
                            borderColor: Colors.transparent,
                            borderWidth: 0,
                            child: Center(
                              child: Text(
                                cartController.imgeList.length.toString(),
                                style: categoryText,
                              ),
                            ))
                      ],
                    ),
                    Spaces(height: 0.040, width: 0),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: cartController.titleList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height * 0.010),
                            child: CartTile(
                                image: cartController.imgeList[index],
                                title: cartController.titleList[index],
                                price: cartController.priceList[index]));
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
