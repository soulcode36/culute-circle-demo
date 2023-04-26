// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Cards extends StatelessWidget {
  Cards({super.key, required this.title, required this.image});

  String title;
  String image;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.blueGrey,
      borderRadius: const BorderRadius.all(Radius.circular(14)),
      elevation: 10,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.190,
        width: MediaQuery.of(context).size.height * 0.190,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(4),
          ),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(image),
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.manrope(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
                fontSize: 16.5),
          ),
        ),
      ),
    );
  }
}
