import 'package:findatoilet/welcome/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(FindAToilet());
}

class FindAToilet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Welcome(),
    );
  }
}
