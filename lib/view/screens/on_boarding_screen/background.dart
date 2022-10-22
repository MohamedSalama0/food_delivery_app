// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/size_config.dart';

class Background extends StatelessWidget {
  Widget child;

  Background({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Stack(
      children: [
        Container(
          height: double.infinity,
          child: Image.asset(
            'assets/images/background_fast_food4.jpg',
            fit: BoxFit.fitHeight,
          ),
        ),
        child,
      ],
    );
  }
}
