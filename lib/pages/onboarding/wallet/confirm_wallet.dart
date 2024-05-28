import 'dart:convert';

import 'package:bitbust/configs/constants.dart';
import 'package:bitbust/controller/authController.dart';
import 'package:bitbust/model/user_model.dart';
import 'package:bitbust/navbar.dart';
import 'package:bitbust/widgets/alert.dart';
import 'package:bitbust/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmWallet extends StatefulWidget {
  final String pin;

  const ConfirmWallet({Key? key, required this.pin}) : super(key: key);

  @override
  _ConfirmWalletState createState() => _ConfirmWalletState();
}

class _ConfirmWalletState extends State<ConfirmWallet> {
  Future<void> updatePin(String pin) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    progressIndicator(context);
    if (token == null) {
      // Handle the case where the token is not found
      print('Token not found in local storage');
      return;
    }

    const url = '$baseUrl/user/update-pin';
    final headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    final body = jsonEncode({'pin': pin, "action": "create"});

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );
    final Map<String, dynamic> responseBody = json.decode(response.body);
    final message = responseBody["message"];
    if (response.statusCode == 200) {
      alert(context, 'success', message);
      User? user = await fetchUserData(token);
      if (user != null) {
        Get.to(Navbar());
        print('Pin updated successfully');
      } else {
        alert(context, 'error', 'Failed to fetch user data.');
      }

      print('Pin updated successfully');
    } else {
      alert(context, 'error', message);
      print('Failed to update pin: ${response.statusCode}');
    }
  }

  String confirmPin = '';

  void _onKeyPressed(String value) {
    setState(() {
      if (value == 'backspace') {
        if (confirmPin.isNotEmpty) {
          confirmPin = confirmPin.substring(0, confirmPin.length - 1);
        }
      } else if (confirmPin.length < 4) {
        // Assuming pin length is 4
        confirmPin += value;
      }
    });
  }

  Widget _buildPinDots() {
    List<Widget> dots = [];
    for (int i = 0; i < 4; i++) {
      dots.add(Container(
        height: 30,
        width: 30,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: CircleAvatar(
          radius: 10,
          backgroundColor:
              i < confirmPin.length ? Colors.black : Colors.grey[300],
        ),
      ));
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: dots,
    );
  }

  Widget _buildKeypadButton(String value) {
    return GestureDetector(
      onTap: () => _onKeyPressed(value),
      child: Container(
        margin: EdgeInsets.all(15),
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.grey[200],
        ),
        child: Center(
          child: value == 'backspace'
              ? Icon(Icons.backspace_outlined, size: 24)
              : Text(
                  value,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }

  Widget _buildKeypad() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildKeypadButton('1'),
            _buildKeypadButton('2'),
            _buildKeypadButton('3'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildKeypadButton('4'),
            _buildKeypadButton('5'),
            _buildKeypadButton('6'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildKeypadButton('7'),
            _buildKeypadButton('8'),
            _buildKeypadButton('9'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 60, height: 60),
            _buildKeypadButton('0'),
            _buildKeypadButton('backspace'),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.pin);
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
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Confirm your Wallet Pin',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy Medium'),
            ),
            SizedBox(height: 8),
            Text(
              "Let's onboard you!",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  fontFamily: 'Gilroy Medium'),
            ),
            SizedBox(height: 32),
            _buildPinDots(),
            SizedBox(height: 32),
            _buildKeypad(),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                final pin = confirmPin;
                if (confirmPin == widget.pin) {
                  updatePin(pin);
                  print('PIN confirmed successfully.');
                } else {
                  alert(context, 'error', 'PINs do not match.');
                  print('PINs do not match.');
                }
                // Get.to(Login());
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
                padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
