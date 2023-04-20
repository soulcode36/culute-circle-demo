import 'package:demo/Home/product%20description/product_description_screen.dart';
import 'package:demo/widgets/spaces.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../theme/theme.dart';
import '../../widgets/shape.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.030,
              horizontal: MediaQuery.of(context).size.height * 0.030),
          child: Column(
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
                    "Trending kicks",
                    style: headline,
                  ),
                  const Spacer(),
                ],
              ),
              Spaces(height: 0.030, width: 0),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisExtent: MediaQuery.of(context).size.height * 0.27,
                    crossAxisSpacing: MediaQuery.of(context).size.width * 0.041,
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
    );
  }
}
