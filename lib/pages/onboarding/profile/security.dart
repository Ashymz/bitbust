import 'dart:ui';
import 'package:bitbust/widgets/bottom_modal_widget.dart';
import 'package:bitbust/widgets/bottom_pin_modal.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Security extends StatefulWidget {
  @override
  _SecurityState createState() => _SecurityState();
}

class _SecurityState extends State<Security> {
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
                    'Security',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gilroy Bold'),
                  ),
                ),
              ),

              SizedBox(height: 30),
              Card(
                color: Colors.white,
                elevation: 0.7,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.75,
                              child: ChangePasswordModal(),
                            ),
                          );
                        },
                      );
                    },
                    leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(220, 254, 254, 254),
                            border: Border.all(
                                width: 0.6, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset('assets/lock.png')),
                    title: Transform.translate(
                      offset: const Offset(-2, -3),
                      child: const Text(
                        'Password',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy Medium',
                        ),
                      ),
                    ),
                    subtitle: Transform.translate(
                      offset: const Offset(-2, -3),
                      child: const Text(
                        'Change account password',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Gilroy Medium',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Card(
                color: Colors.white,
                elevation: 0.7,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: ListTile(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (context) {
                          return BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.75,
                              child: ChangePin(),
                            ),
                          );
                        },
                      );
                    },
                    leading: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            border: Border.all(
                                width: 0.6, color: Colors.transparent),
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset('assets/lock.png')),
                    title: Transform.translate(
                      offset: const Offset(-2, -3),
                      child: const Text(
                        'Transaction Pin',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy Medium',
                        ),
                      ),
                    ),
                    subtitle: Transform.translate(
                      offset: const Offset(-2, -3),
                      child: const Text(
                        'Change Transaction Pin',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          fontFamily: 'Gilroy Medium',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

            ],
          ),
        ),
      ),
    );
  }

}
