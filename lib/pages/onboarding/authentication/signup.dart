import 'package:bitbust/controller/authController.dart';
import 'package:bitbust/pages/onboarding/authentication/login.dart';
import 'package:bitbust/pages/onboarding/authentication/verify_otp.dart';
import 'package:bitbust/pages/onboarding/profile/legal.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;
  bool _obscurePassword1 = true;
  String? passwordValidationError;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController middleNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  void password() {
    setState(() {
      _obscurePassword1 = _obscurePassword1;
    });
  }

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
          'BitBust',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Gilroy Bold',
            fontSize: 30,
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20),
                          const Text(
                            'Create Account',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Gilroy Medium'),
                          ),
                          const Text('Let\'s get you setup!',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Gilroy Medium')),
                          SizedBox(height: 20),
                          _buildTextField(
                            firstNameController,
                            Image.asset('assets/profile.png'),
                            'First Name',
                          ),
                          SizedBox(height: 10),
                          _buildTextField(
                            lastNameController,
                            Image.asset('assets/profile.png'),
                            'Last Name',
                          ),
                          SizedBox(height: 20),
                          _buildTextField(
                            middleNameController,
                            Image.asset('assets/profile.png'),
                            'Middle Name (Optional)',
                          ),
                          SizedBox(height: 20),
                          _buildTextField(
                            emailController,
                            Image.asset('assets/mail.png'),
                            'Email Address',
                          ),
                          SizedBox(height: 20),
                          _buildTextField(
                            phoneController,
                            Image.asset('assets/call.png'),
                            'Phone Number',
                          ),
                          SizedBox(height: 20),
                          _buildPasswordField(passwordController, 'Password'),
                          SizedBox(height: 20),
                          _buildPasswordField(
                              confirmPasswordController, 'Confirm Password'),
                          SizedBox(height: 25),
                          Center(
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text:
                                    'By clicking on signup, you agree to the BitBust ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Gilroy Medium',
                                  fontSize: 13,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Get.to(Legal());
                                      },
                                    text: 'Terms of Service',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: 'Gilroy Medium',
                                      fontSize: 13,
                                    ),
                                  ),
                                  TextSpan(
                                    text: ' and ',
                                  ),
                                  TextSpan(
                                    text: 'Privacy Policy',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontFamily: 'Gilroy Medium',
                                      fontSize: 13,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // SizedBox(height: 25),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  final firstName = firstNameController.text.trim();
                  final lastName = lastNameController.text.trim();
                  final email = emailController.text.trim();
                  final phone = phoneController.text.trim();
                  final password = passwordController.text.trim();
                  final confirmPassword = confirmPasswordController.text.trim();
                  register(context, firstName, lastName, email, phone, password,
                      confirmPassword);
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
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Already have an account?',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Gilroy Medium',
                    fontSize: 13,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.to(const Login());
                        },
                      text: 'Log in',
                      style: TextStyle(
                        color: Colors.green,
                        fontFamily: 'Gilroy Medium',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
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
