import 'dart:convert';

import 'package:bitbust/configs/constants.dart';
import 'package:bitbust/controller/authController.dart';
import 'package:bitbust/navbar.dart';
import 'package:bitbust/pages/onboarding/authentication/forgot_password.dart';
import 'package:bitbust/pages/onboarding/authentication/signup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  late final LocalAuthentication auth;
  bool _supportState = false;

  @override
  void initState() {
    super.initState();
    auth = LocalAuthentication();
    auth.isDeviceSupported().then(
      (bool isSupported) {
        setState(() {
          _supportState = isSupported;
        });
      },
    );
  }

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
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: PopScope(
        canPop: false,
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 40),
                            const Text(
                              'Welcome Back',
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Gilroy Medium'),
                            ),
                            const Text(
                                'We\'ve been expecting you, please enter login',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Gilroy Medium')),
                            const SizedBox(height: 2),
                            const Text(
                                'details below to securely access your account.',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Gilroy Medium')),
                            const SizedBox(height: 20),
                            _buildTextField(
                              emailController,
                              Image.asset('assets/mail.png'),
                              'Username or Email Address',
                            ),
                            SizedBox(height: 10),
                            _buildPasswordField(passwordController, 'Password'),
                            const SizedBox(height: 20),
                            GestureDetector(
                              onTap: () {
                                Get.to(const ForgotPassword());
                              },
                              child: const Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  'Forgot Password?',
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.red,
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'Gilroy Medium'),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                            SizedBox(height: 25),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  final email = emailController.text.trim();
                                  final password =
                                      passwordController.text.trim();
                                  login(context, email, password);
                                },
                                child: const Text('Login',
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 100, vertical: 15),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Center(
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  text: 'Dont have an account? ',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontFamily: 'Gilroy Medium',
                                    fontSize: 13,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Get.to(SignUpScreen());
                                        },
                                      text: 'Create a new account',
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontFamily: 'Gilroy Medium',
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            const SizedBox(height: 60),
                            GestureDetector(
                                onTap: () {
                                  // setupBiometrics(context);
                                  authenticate();
                                },
                                child: Center(
                                    child:
                                        Image.asset('assets/fingerprint.png')))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> authenticate() async {
    try {
      bool authenticated = await auth.authenticate(
        localizedReason: 'Authenticate to Login',
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );

      if (authenticated) {
        print('Authenticated : $authenticated');
        Get.to(Navbar());
      } else {
        print('Authentication failed');
      }
    } on PlatformException catch (e) {
      print('Authentication error: $e');
    }
  }

  Widget _buildTextField(
      TextEditingController controller, Widget icon, String hintText) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hintText,
        hintStyle: TextStyle(fontFamily: 'Gilroy Medium'),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }

  bool _obscureText = true;

  Widget _buildPasswordField(
      TextEditingController controller, String hintText) {
    bool obscureText = true;
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Image.asset('assets/lock.png'),
        suffixIcon: IconButton(
          icon: Icon(Icons.visibility),
          onPressed: () {
            setState(() {
              obscureText = !obscureText;
            });
          },
        ),
        hintText: hintText,
        hintStyle: TextStyle(fontFamily: 'Gilroy Medium'),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4),
        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
    );
  }
}
