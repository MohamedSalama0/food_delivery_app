import 'package:flutter/material.dart';
import 'package:food_delivery_app/view/screens/home_screen/home_screen.dart';
import 'package:food_delivery_app/view/screens/on_boarding_screen/on_boarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Ultra'
      ),
      home: const OnBoardingScreen(),
    );
  }
}

