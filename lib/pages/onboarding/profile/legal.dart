import 'dart:ui';
import 'package:bitbust/widgets/bottom_modal_widget.dart';
import 'package:bitbust/widgets/bottom_pin_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Legal extends StatefulWidget {
  @override
  _LegalState createState() => _LegalState();
}

class _LegalState extends State<Legal> {
  // int _selectedIndex = 4;

  // // void _onItemTapped(int index) {
  // //   setState(() {
  // //     _selectedIndex = index;
  // //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Gilroy Bold',
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Legal',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gilroy Bold'),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    onTap: () {},
                    title: Transform.translate(
                      offset: const Offset(-7, 0),
                      child: const Text(
                        'Privacy Policy',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Gilroy Medium',
                        ),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                      size: 19,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: ListTile(
                    onTap: () {},
                    title: Transform.translate(
                      offset: const Offset(-7, 0),
                      child: const Text(
                        'Terms and Conditions',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Gilroy Medium',
                        ),
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.black,
                      size: 19,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
