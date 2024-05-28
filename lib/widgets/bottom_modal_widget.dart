import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangePasswordModal extends StatelessWidget {
  const ChangePasswordModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        height: 100,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Change Password',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gilroy Medium'),
                  ),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
              Text(
                'Update your account password',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: 'Gilroy Medium'),
              ),
              SizedBox(height: 20),
              _buildPasswordField('Password'),
              const SizedBox(height: 20),
              _buildPasswordField('Password'),
              SizedBox(height: 20),
              Text(
                'Must be more than 8 characters and contain at least one capital letter, one number and one special character',
                style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontFamily: 'Gilroy Medium'),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Get.to();
                  },
                  child: Text('Update',
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
            ],
          ),
        ));
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
