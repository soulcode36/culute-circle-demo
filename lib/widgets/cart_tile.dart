import 'package:demo/theme/theme.dart';
import 'package:flutter/material.dart';

class CartTile extends StatelessWidget {
  CartTile(
      {super.key,
      required this.image,
      required this.title,
      required this.price});

  final String image;
  final String title;
  final int price;
  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
        color: Colors.blueGrey,
        elevation: 2,
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.090,
          width: MediaQuery.of(context).size.width * 1,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.230,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                    ),
                    image: DecorationImage(
                        fit: BoxFit.fill, image: NetworkImage(image))),
              ),
              Spacer(),
              Text(
                title,
                style: segmentText,
              ),
              Spacer(),
              Text(
                price.toString(),
                style: segmentText,
              ),
              Spacer(),
            ],
          ),
        ));
  }
}
