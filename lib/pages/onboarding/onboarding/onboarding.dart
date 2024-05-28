import 'dart:async';

import 'package:bitbust/pages/onboarding/authentication/signup.dart';
// import 'package:bitbust/pages/onboarding/authentication/verify_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authentication/login.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  List<Widget> _buildPageContent(BuildContext context) {
    return [
      _buildPage(
        image: 'assets/onboarding1.png',
        title: 'BitBust',
        description:
            'Your one-stop solution for cryptocurrency, and gift card exchange.',
      ),
      _buildPage(
        image: 'assets/onboarding2.png',
        title: 'Secure Transactions',
        description:
            "Simplify your cryptocurrency transactions with BitBust's seamless exchange services.",
      ),
      _buildPage(
        image: 'assets/onboarding3.png',
        title: 'Get Started',
        description:
            "Easily manage your digital assests with BitBust'secure multicurrency wallet.",
      ),
    ];
  }

  Widget _buildPage({
    required String image,
    required String title,
    required String description,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 150.0),
        Image.asset(image, height: 360.0),
        Padding(
          padding: const EdgeInsets.all(60),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              fontFamily: 'Gilroy Medium',
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  void _onPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        title: Text(
          'BitBust',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Gilroy Bold',
            fontSize: 30,
          ),
        ),
        leading: Text(''),
        centerTitle: true,
      ),
      body: PopScope(
        canPop: false,
        child: Stack(children: [
          PageView(
            controller: _pageController,
            onPageChanged: _onPageChanged,
            children: _buildPageContent(context),
          ),
          Positioned(
            bottom: 20.0,
            left: 0.0,
            right: 0.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.to(SignUpScreen());
                    },
                    child: Text('Get Started',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Gilroy Medium',
                          fontSize: 21,
                        )),
                  ),
                ),
                SizedBox(width: 20.0),
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 1),
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      Get.to(const Login());
                    },
                    child: Text('Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Gilroy Medium',
                          fontSize: 21,
                        )),
                  ),
                ),
              ],
            ),

            //  List.generate(
            //   3,

            //   (index) => AnimatedContainer(
            //     duration: Duration(milliseconds: 300),
            //     margin: EdgeInsets.symmetric(horizontal: 5.0),
            //     height: 10.0,
            //     width: _currentPage == index ? 20.0 : 10.0,
            //     decoration: BoxDecoration(
            //       color: _currentPage == index ? Colors.blue : Colors.white,
            //       borderRadius: BorderRadius.circular(5.0),
            //     ),
            //   ),
            // ),
          ),
        ]),
      ),
    );
  }
}
