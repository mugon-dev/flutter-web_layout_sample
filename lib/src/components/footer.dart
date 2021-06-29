import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(7),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7), color: Colors.grey.shade300),
      child: Text(
        "Copyright 2021 All Right Reserved",
        style: TextStyle(
          fontSize: 11,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
