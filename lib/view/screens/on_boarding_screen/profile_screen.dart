import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_delivery_app/view/screens/on_boarding_screen/background.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: SafeArea(
        child: Column(
          children: [Center(child: Text('data'))],
        ),
      ),
    );
  }
}
