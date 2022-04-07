import 'package:findatoilet/home/homepage.dart';
import 'package:findatoilet/location/location.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentindex = 0;

  final screens = [
    HomePage(),
    Location()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: screens[currentindex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.white70,
        currentIndex: currentindex,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        onTap: (index) => setState(() => currentindex = index),
        items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
          backgroundColor: Colors.blueGrey),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined),
            label: "Location",
            backgroundColor: Colors.blueGrey),
      ]),
    );
  }
}
