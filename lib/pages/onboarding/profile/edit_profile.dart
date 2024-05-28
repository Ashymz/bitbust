
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditProfile extends StatefulWidget {
  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
          'Edit Profile',
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
                            'My Profile',
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Gilroy Medium'),
                          ),
                          SizedBox(height: 40),
                          const Text('First Name',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Gilroy Medium')),
                          SizedBox(height: 6),
                          _buildTextField(
                              Image.asset('assets/profile.png'), 'First Name'),
                          SizedBox(height: 10),
                          const Text('Last Name',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Gilroy Medium')),
                          SizedBox(height: 10),

                          _buildTextField(
                              Image.asset('assets/profile.png'), 'Last Name'),
                          SizedBox(height: 20),

                          const Text('Email Address',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Gilroy Medium')),
                          SizedBox(height: 10),
                          _buildTextField(
                              Image.asset('assets/mail.png'), 'Email Address'),
                          SizedBox(height: 20),
                          const Text('Phone Number',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Gilroy Medium')),
                          SizedBox(height: 10),
                          PhoneNumberInput(),
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
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(Widget icon, String hintText) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: hintText,
        hintStyle: TextStyle(fontFamily: 'Gilroy Medium'),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 235, 244, 249),
      ),
    );
  }
}

class PhoneNumberInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(
            'assets/icons/nigeria_flag.png',
            width: 24,
            height: 24,
          ),
        ),
        hintText: 'Phone Number',
        hintStyle: TextStyle(fontFamily: 'Gilroy Medium'),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(4),
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 230, 243, 250),
      ),
      initialCountryCode: 'NG',
      onChanged: (phone) {
        print(phone.completeNumber);
      },
    );
  }
}
