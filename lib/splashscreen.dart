import 'dart:async';

import 'package:bitbust/pages/onboarding/onboarding/onboarding.dart';
import 'package:bitbust/widgets/heartbeat_animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with WidgetsBindingObserver {
  void launch() {
    Timer(const Duration(seconds: 4), () {
      Get.to(OnboardingScreen());
    });
  }

  @override
  void initState() {
    super.initState();
    launch();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return MediaQuery(
      data:
          MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(0.85)),
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: Center(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.black,
                    height: height,
                    width: width,
                  ),
                  const Center(
                      child: HeartbeatAnimation(
                          child: Text('BitBust',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Gilroy Medium',
                              )))),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
