import 'package:flutter/material.dart';
import 'package:news/Screens/HomeScreen.dart';

void main() {
  runApp(Newas());
}
class Newas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:  "HomeScreen",
      routes: {
        "HomeScreen" : (_) =>  HomeScreen()

      },
    );
  }
}
