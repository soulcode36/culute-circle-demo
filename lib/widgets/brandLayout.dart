import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BrandLayout extends StatelessWidget {
  BrandLayout({super.key, required this.image});
  String image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {},
        child: CachedNetworkImage(
            imageBuilder: (context, imageProvider) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.17,
                width: MediaQuery.of(context).size.width * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage("$image"))),
              );
            },
            errorWidget: (context, url, error) => Center(
                  child: Icon(Icons.error),
                ),
            placeholder: (context, url) => Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.17,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(color: Colors.grey[100]),
                    child: Center(
                      child: Icon(Icons.image),
                    ),
                  ),
                ),
            imageUrl: image));
  }
}
