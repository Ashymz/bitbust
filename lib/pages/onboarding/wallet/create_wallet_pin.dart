import 'package:bitbust/pages/onboarding/wallet/confirm_wallet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CreateWaletPin extends StatefulWidget {
  const CreateWaletPin({super.key});

  @override
  _CreateWaletPinState createState() => _CreateWaletPinState();
}

class _CreateWaletPinState extends State<CreateWaletPin> {
  final int pinLength = 4;
  String pin = '';

  void _onKeyPressed(String value) {
    setState(() {
      if (value == 'backspace') {
        if (pin.isNotEmpty) {
          pin = pin.substring(0, pin.length - 1);
        }
      } else if (pin.length < pinLength) {
        pin += value;
      }
    });
  }

  Widget _buildPinDots() {
    List<Widget> dots = [];
    for (int i = 0; i < pinLength; i++) {
      dots.add(Container(
        height: 30,
        width: 30,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: CircleAvatar(
          radius: 10,
          backgroundColor: i < pin.length ? Colors.black : Colors.grey[300],
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
            SizedBox(width: 60, height: 60), // Placeholder for alignment
            _buildKeypadButton('0'),
            _buildKeypadButton('backspace'),
          ],
        ),
      ],
    );
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
      body: Padding(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Create your Wallet Pin',
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
            SizedBox(height: 22),
            _buildPinDots(),
            SizedBox(height: 22),
            _buildKeypad(),
            SizedBox(height: 45),
            ElevatedButton(
              onPressed: () {
                Get.to(ConfirmWallet(pin: pin));
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
