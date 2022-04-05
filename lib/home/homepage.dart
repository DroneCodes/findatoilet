import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home),
            SizedBox(
              width: 20,
            ),
            Text("Home")
          ],
        ),
      ),
      body: Text("Hello"),
    );
  }
}