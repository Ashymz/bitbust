import 'package:bitbust/controller/authController.dart';
import 'package:flutter/material.dart';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool isCompleted = false;

  final TextEditingController emailController = TextEditingController();
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
                        'Account Recovery',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Gilroy Medium'),
                      ),
                      const SizedBox(height: 10.0),
                      const Text('Lets get you back onboard!',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Gilroy Medium')),
                      const SizedBox(height: 60.0),
                      _buildTextField(
                        emailController,
                        Image.asset('assets/mail.png'),
                        'Email Address',
                      ),
                      const SizedBox(height: 20),
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
                    final email = emailController.text.trim();
                    // Get.to(const VerifyPasswordOtp());
                    forgotPassword(context, email);
                  },
                  child: Text('Continue',
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

  Widget _buildPasswordField(String hintText) {
    return TextField(
      obscureText: true,
      strutStyle: StrutStyle(fontFamily: 'Gilroy Medium'),
      decoration: InputDecoration(
        labelStyle: TextStyle(fontFamily: 'Gilroy Medium'),
        prefixIcon: Image.asset('assets/lock.png'),
        suffixIcon: Icon(Icons.visibility),
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
