import 'package:demo/theme/theme.dart';
import 'package:flutter/material.dart';

class Cards extends StatelessWidget {
  Cards({super.key, required this.title, required this.image});

  String title;
  String image;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.blueGrey,
      borderRadius: BorderRadius.all(Radius.circular(14)),
      elevation: 2,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.190,
        width: MediaQuery.of(context).size.height * 0.190,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(image),
          ),
        ),
        child: Center(
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: categoryText,
          ),
        ),
      ),
    );
  }
}
