import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/common/size_config.dart';

import 'app_style.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    double displayWidth = MediaQuery.of(context).size.width;
    return Container(
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      // margin: EdgeInsets.all(displayWidth * .05),
      margin: EdgeInsets.only(bottom: getResponsiveScreenHeight(0.001)),
      height: getResponsiveScreenHeight(7),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        // ignore: prefer_const_constructors
        border: Border.all(color: grey),
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 113, 111, 111),
            blurRadius: 70,
            // spreadRadius: 5,
            blurStyle: BlurStyle.normal,
            offset: Offset(0, 25),
          ),
        ],
        borderRadius: BorderRadius.circular(11),
      ),
      child: ListView.builder(
        itemCount: 4,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: displayWidth * .02),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
              HapticFeedback.lightImpact();
            });
          },
          // splashColor: Colors.blue,
          // highlightColor: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: getResponsiveScreenWidth(4.6)),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AnimatedContainer(
                  //   duration: const Duration(seconds: 1),
                  //   curve: Curves.fastLinearToSlowEaseIn,
                  //   // color: Colors.red,
                  // ),
                  // SizedBox(height: getResponsiveScreenWidth(5.5)),
                  AnimatedOpacity(
                    opacity: 1,
                    duration: const Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: Text(
                      listOfStrings[index],
                      style: TextStyle(
                        color: currentIndex == index
                            ? const Color.fromARGB(255, 129, 36, 3)
                            : const Color.fromARGB(255, 16, 8, 2),
                        fontWeight: FontWeight.w400,
                        fontSize: 17,
                      ),
                    ),
                  ),
                  currentIndex == index
                      ? AnimatedContainer(
                          decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(1.5)),
                            color: Color.fromARGB(255, 129, 36, 3),
                          ),
                          alignment: AlignmentDirectional.centerEnd,
                          duration: const Duration(seconds: 3),
                          height: 3,
                          width: 20,
                          curve: Curves.bounceInOut,
                        )
                      : const SizedBox(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<String> listOfStrings = [
  'MENU',
  'FEATURED',
  'RECENTS',
  'FAVORITES',
];

Widget txtButton({
  required Function() onTap,
  required String text,
  Color? backColor = primaryColor,
  Color? textColor = Colors.white,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: txtColor),
        color: backColor,
      ),
      height: getResponsiveScreenHeight(4.2),
      width: getResponsiveScreenWidth(42),
      child: Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            letterSpacing: 0.8,
            color: textColor,
            fontWeight: FontWeight.w200,
          ),
        ),
      ),
    ),
  );
}

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  late ScrollController _scrollController;
  double scrollOffset = 0.0;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(() {
        _onScroll();
      });

    super.initState();
  }

  void _onScroll() {
    setState(() {
      scrollOffset = _scrollController.offset;
      print(scrollOffset);
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.13,
      minChildSize: 0.13,
      builder: ((context, scrollController) {
        // print(scrollController.offset);
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: SingleChildScrollView(
            controller: scrollController,
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            child: Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  controller: scrollController,
                  // physics: const NeverScrollableScrollPhysics(),
                  child: Stack(
                    children: [
                      SizedBox(
                        height: getResponsiveScreenHeight(10),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            left: getResponsiveScreenWidth(45),
                            right: getResponsiveScreenWidth(45),
                            top: getResponsiveScreenHeight(1)),
                        height: 6,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 125, 124, 122)
                              .withOpacity(0.5),
                          borderRadius: const BorderRadius.all(
                            Radius.circular(150),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: getResponsiveScreenHeight(6),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: getResponsiveScreenHeight(5)),
                        alignment: Alignment.center,
                        child: const Text(
                          'MENU',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Color.fromARGB(255, 68, 44, 35),
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              letterSpacing: 0.7),
                        ),
                      ),
                      SizedBox(
                        height: getResponsiveScreenHeight(30),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: getResponsiveScreenHeight(12)),
                        height: getResponsiveScreenHeight(130),
                        child: ListView.builder(
                          // physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          controller: scrollController,
                          scrollDirection: Axis.vertical,
                          itemCount: 15,
                          itemBuilder: ((context, index) => Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SizedBox(
                                        width: getResponsiveScreenWidth(3),
                                      ),
                                      Image.asset(
                                        'assets/images/burrito.png',
                                        scale: 7.0,
                                      ),
                                      SizedBox(
                                        width: getResponsiveScreenWidth(10),
                                      ),
                                      const Text(
                                        'BURRITO',
                                        style: TextStyle(
                                          color: txtColor,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: getResponsiveScreenHeight(3),
                                  )
                                ],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                    height: SizeConfig.screenHeight! - 50,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    // margin:
                    // EdgeInsets.only(bottom: getResponsiveScreenHeight(10)),
                    alignment: AlignmentDirectional.bottomCenter,
                    child: const BottomNavBar()),
              ],
            ),
          ),
        );
      }),
    );
  }
}
