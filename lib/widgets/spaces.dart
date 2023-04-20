import 'package:flutter/material.dart';

class Spaces extends StatelessWidget {
  Spaces({super.key, required this.height, required this.width, this.child});

  final double height;
  final double width;
  Widget? child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * height,
      width: MediaQuery.of(context).size.width * width,
      child: child,
    );
  }
}
