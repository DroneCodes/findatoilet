// ignore_for_file: deprecated_member_use

import 'package:findatoilet/home/home.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Container(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Find A Toilet",
                style: TextStyle(color: Colors.black, fontSize: 40),
              ),
              SizedBox(
                height: size.height * 0.5,
              ),
              Container(
                color: Colors.blueGrey,
                margin: const EdgeInsets.symmetric(vertical: 15),
                width: size.width * 0.7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(29),
                  child: FlatButton(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40),
                      color: Colors.blue[300],
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return Home();
                        }));
                      },
                      child: const Text(
                        "Welcome",
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
