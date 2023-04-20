import 'package:demo/Home/category/categoty_screen.dart';
import 'package:demo/Home/product%20description/product_description_screen.dart';
import 'package:demo/theme/theme.dart';
import 'package:demo/widgets/buttons.dart';
import 'package:demo/widgets/constant_images.dart';
import 'package:demo/widgets/shape.dart';
import 'package:demo/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/cards.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.060,
                horizontal: MediaQuery.of(context).size.height * 0.030),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.190,
                  width: MediaQuery.of(context).size.width * 1,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          fit: BoxFit.fill, image: NetworkImage(imagUrl)),
                      color: appTheme.buttonColor,
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                ),
                Spaces(height: 0.04, width: 0),
                Text(
                  "Our Categories",
                  style: headline,
                ),
                Spaces(height: 0.01, width: 0),
                Spaces(
                  height: 0.2,
                  width: 1,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(() => CategoryScreen());
                        },
                        child: Padding(
                          padding: EdgeInsets.only(
                              right: MediaQuery.of(context).size.width * 0.030),
                          child: Cards(title: 'Jordan Mocha', image: imagUrl),
                        ),
                      );
                    },
                  ),
                ),
                Spaces(height: 0.04, width: 0),
                Text(
                  "Trending kicks",
                  style: headline,
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 4,
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisExtent: MediaQuery.of(context).size.height * 0.27,
                      crossAxisSpacing:
                          MediaQuery.of(context).size.width * 0.041,
                      crossAxisCount: 2,
                      mainAxisSpacing:
                          MediaQuery.of(context).size.height * 0.010),
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          Get.to(() => ProductDescription());
                        },
                        child: ProductDesign(title: 'title', price: "₹17,500"));
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
