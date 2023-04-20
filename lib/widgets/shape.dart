import 'package:demo/theme/theme.dart';
import 'package:demo/widgets/constant_images.dart';
import 'package:flutter/material.dart';

class ProductDesign extends StatelessWidget {
  ProductDesign({super.key, required this.title, required this.price});

  String title;
  String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.01),
      decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.all(Radius.circular(18))),
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 3,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                image: DecorationImage(
                    fit: BoxFit.fill, image: NetworkImage(imagUrl))),
          ),
          PhysicalModel(
            elevation: 1,
            color: Colors.blueGrey,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(8),
              bottomRight: Radius.circular(8),
            ),
            child: Container(
                height: MediaQuery.of(context).size.height * 0.050,
                width: MediaQuery.of(context).size.width * 3,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.020),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          title,
                          style: titleText,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.030,
                        ),
                        Text(
                          price,
                          style: caption,
                        )
                      ]),
                )),
          )
        ],
      ),
    );
  }
}
