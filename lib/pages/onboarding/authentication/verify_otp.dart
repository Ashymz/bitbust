import 'package:bitbust/controller/authController.dart';
import 'package:bitbust/pages/onboarding/authentication/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pin_put/pin_put.dart';

class VerifyOtp extends StatefulWidget {
  final String email;

  const VerifyOtp({Key? key, required this.email}) : super(key: key);

  @override
  State<VerifyOtp> createState() => _VerifyOtpState();
}

class _VerifyOtpState extends State<VerifyOtp> {
  bool isCompleted = false;
  final TextEditingController _pinPutController =
      TextEditingController(text: '123456');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            // Get.back();
          },
          child: Text(''),
        ),
        title: const Text(
          'BitBust',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Gilroy Bold',
            fontSize: 35,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      const Text(
                        'Create Account',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gilroy Medium'),
                      ),
                      const SizedBox(height: 10.0),
                      const Text('Enter OTP',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Gilroy Medium')),
                      const SizedBox(height: 25.0),
                      Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text("Code has been sent to ${widget.email}",
                              style: TextStyle(
                                  fontSize: 15, fontFamily: 'Gilroy Medium')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: PinPut(
                          pinAnimationType: PinAnimationType.slide,
                          textStyle: const TextStyle(
                              color: Colors.black,
                              fontFamily: 'Medium',
                              fontSize: 20),
                          fieldsCount: 6,
                          eachFieldWidth: 30.0,
                          eachFieldHeight: 60.0,
                          submittedFieldDecoration: _pinPutDecoration.copyWith(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          selectedFieldDecoration: _pinPutDecoration.copyWith(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          followingFieldDecoration: _pinPutDecoration.copyWith(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          controller: _pinPutController,
                          // enabled: false,
                        ),
                      ),
                      const SizedBox(height: 35.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Resend Code in',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.green,
                                fontFamily: 'Gilroy Medium'),
                          ),
                          const SizedBox(width: 3.0),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              '58s',
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  color: Colors.green,
                                  fontFamily: 'Gilroy Medium'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    final email = widget.email;
                    final token = _pinPutController.text;
                    verifyEmail(context, token, email);
                  },
                  child: Text('Sign Up',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Gilroy Medium')),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }

  final BoxDecoration _pinPutDecoration = BoxDecoration(
    border: Border(bottom: BorderSide(color: Colors.black, width: 2.0)),
  );
}
