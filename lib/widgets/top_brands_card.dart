// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TopBrands extends StatelessWidget {
  final String image;
  const TopBrands({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        height: 70,
        width: 90,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            image,
            height: 10,
            width: 20,
            fit: BoxFit.contain,
            // color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
