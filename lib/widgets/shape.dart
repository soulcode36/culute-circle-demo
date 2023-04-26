// ignore_for_file: must_be_immutable

import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/Home/product%20description/product_description_screen.dart';
import 'package:demo/theme/theme.dart';
import 'package:demo/widgets/spaces.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProductDesign extends StatelessWidget {
  ProductDesign({
    super.key,
    required this.product,
  });

  dynamic product;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => ProductDescriptionScreen(product: product));
      },
      child: PhysicalModel(
        elevation: 4,
        color: Colors.blueGrey,
        borderRadius: const BorderRadius.all(Radius.circular(1)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.28,
          width: MediaQuery.of(context).size.width * 0.4,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(Radius.circular(1)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.010,
                horizontal: MediaQuery.of(context).size.width * 0.020),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CachedNetworkImage(
                    imageBuilder: (context, imageProvider) {
                      return Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        width: MediaQuery.of(context).size.width * 1,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.fitHeight,
                                image: NetworkImage(product['images'][0]))),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(Icons.favorite_border_outlined)),
                      );
                    },
                    errorWidget: (context, url, error) => Center(
                          child: Icon(Icons.error),
                        ),
                    placeholder: (context, url) => Center(
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.1,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(color: Colors.grey[100]),
                            child: Center(
                              child: Icon(Icons.image),
                            ),
                          ),
                        ),
                    imageUrl: product['images'][0]),
                Spaces(height: 0.010, width: 0),
                Text(
                  "${product['title']}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: segmentText,
                ),
                Spaces(height: 0.0140, width: 0),
                Text(
                  "Lowest Ask",
                  style: caption,
                ),
                Spaces(height: 0.0140, width: 0),
                Text(
                  "${product['price']}",
                  style: titleText,
                ),
                Spaces(height: 0.010, width: 0),
                Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width * 0.07),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.03,
                    width: MediaQuery.of(context).size.width * 0.6,
                    decoration: BoxDecoration(color: Colors.grey[300]),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Last Sale : ${product['last sale']}",
                        style: segmentText,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
