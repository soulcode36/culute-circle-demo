import 'package:demo/cart/cart_controller.dart';
import 'package:demo/widgets/buttons.dart';
import 'package:demo/widgets/constant_images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';
import '../../widgets/spaces.dart';

class ProductDescription extends StatelessWidget {
  ProductDescription({super.key});

  CartController cartController = Get.put(CartController());

  int price = 17500;
  String title = 'Jordan Mocha';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.030,
                horizontal: MediaQuery.of(context).size.height * 0.030),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Get.back();
                        },
                        child: const Icon(Icons.arrow_back_ios)),
                    const Spacer(),
                    Text(
                      title,
                      style: headline,
                    ),
                    const Spacer(),
                  ],
                ),
                Spaces(height: 0.030, width: 0),
                Container(
                  height: MediaQuery.of(context).size.height * 0.190,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.fill, image: NetworkImage(imagUrl)),
                      color: appTheme.buttonColor,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                Spaces(height: 0.030, width: 0),
                Row(
                  children: [
                    Text(
                      title,
                      style: titleText,
                    ),
                    Spacer(),
                    Text(
                      "$price",
                      style: titleText,
                    )
                  ],
                ),
                Spaces(height: 0.020, width: 0),
                Row(
                  children: [
                    Text(
                      "Ratings",
                      style: titleText,
                    ),
                    Spacer(),
                    for (int i = 0; i < 4; i++)
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      )
                  ],
                ),
                Spaces(height: 0.020, width: 0),
                InkWell(
                  onTap: () {
                    cartController.addToCart(imagUrl, title, price);
                  },
                  child: Buttons(
                      height: 0.060,
                      width: 0.34,
                      radius: 12,
                      color: appTheme.buttonColor,
                      borderColor: Colors.transparent,
                      borderWidth: 0,
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              Icons.shopping_bag,
                              color: Colors.white,
                            ),
                            Text(
                              "Add to cart",
                              style: categoryText,
                            )
                          ],
                        ),
                      )),
                ),
                Spaces(height: 0.020, width: 0),
                Text(
                  "Description : ",
                  style: titleText,
                ),
                Spaces(height: 0.010, width: 0),
                Text(
                  '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.''',
                  style: caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
