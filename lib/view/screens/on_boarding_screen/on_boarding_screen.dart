import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/app_style.dart';
import 'package:food_delivery_app/common/size_config.dart';
import 'package:food_delivery_app/view/screens/on_boarding_screen/background.dart';
import 'package:food_delivery_app/view/screens/on_boarding_screen/profile_screen.dart';

import '../../../common/reusable_widget.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  double _opacity = 0.0;
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: Background(
        child: SafeArea(
          child: PageView(
            scrollDirection: Axis.horizontal,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: getResponsiveScreenHeight(1.5),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => const ProfileScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.person_outline),
                        iconSize: 35,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.9),
                            borderRadius: BorderRadius.circular(30)),
                        height: getResponsiveScreenHeight(4.2),
                        width: getResponsiveScreenWidth(48),
                        child: const Center(
                          child: Text(
                            'PICKUP OR DELIVERY',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w200,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.shopping_bag_outlined),
                        iconSize: 35,
                      ),
                    ],
                  ),
                  Container(
                    margin:
                        EdgeInsets.only(bottom: getResponsiveScreenHeight(4)),
                    alignment: Alignment.center,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          height: 350,
                          width: 350,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(1, 6),
                                  blurStyle: BlurStyle.normal,
                                  blurRadius: 25,
                                  spreadRadius: 0.5,
                                ),
                                BoxShadow(
                                  color: Colors.black45,
                                  offset: Offset(1, 20),
                                  blurStyle: BlurStyle.normal,
                                  blurRadius: 35,
                                  spreadRadius: 0.1,
                                ),
                              ],
                              color: const Color.fromARGB(255, 242, 241, 238),
                              borderRadius: BorderRadius.circular(25)),
                          child: Column(
                            children: [
                              SizedBox(height: getResponsiveScreenHeight(6)),
                              const Text(
                                'JOIN REWARDS.\nGET REWARDED.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: txtColor,
                                  fontSize: 33,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: getResponsiveScreenHeight(2),
                              ),
                              const Text(
                                'Choose the real reward you\n want for eating real food, really.',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(194, 78, 51, 41),
                                ),
                              ),
                              SizedBox(
                                height: getResponsiveScreenHeight(4.5),
                              ),
                              txtButton(
                                onTap: () {},
                                text: 'CREATE ACCOUNT',
                              ),
                              SizedBox(
                                height: getResponsiveScreenHeight(2),
                              ),
                              txtButton(
                                onTap: () {},
                                text: 'SIGN IN',
                                backColor: Colors.transparent,
                                textColor: txtColor,
                              ),
                            ],
                          ),
                        ),
                        // Image
                        Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(
                              top: getResponsiveScreenHeight(15),
                              right: getResponsiveScreenWidth(3)),
                          child: Image.asset(
                            'assets/images/Vast-1 (3).png',
                            scale: 7.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const CustomBottomSheet(),
                ],
              ),
              const ProfileScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
