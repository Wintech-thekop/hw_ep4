import 'package:flutter/material.dart';
import 'package:hw_ep4/showscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter Bootcamp EP4",
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              "ซื้อวัคซีน ออนไลน์",
              style: TextStyle(
                fontSize: 30,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: ShowScreen(),
      ),
    );
  }
}
