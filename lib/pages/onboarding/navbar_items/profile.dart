import 'package:bitbust/pages/onboarding/authentication/login.dart';
import 'package:bitbust/pages/onboarding/profile/edit_profile.dart';
import 'package:bitbust/pages/onboarding/profile/legal.dart';
import 'package:bitbust/pages/onboarding/profile/security.dart';
import 'package:bitbust/pages/onboarding/profile/settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
            // Get.back();
          },
          child: Text(''),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/avatar.png'),
                    ),
                    SizedBox(width: 50),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 206, 231, 244),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.camera_alt, color: Colors.grey[500]),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Hello, Kolade',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gilroy Bold'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Manage your account & Preferences',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontFamily: 'Gilroy Medium'),
                  ),
                ),
              ),

              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: ListTile(
                  onTap: () {
                    Get.to(EditProfile());
                  },
                  leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 206, 231, 244),
                          border:
                              Border.all(width: 0.6, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset('assets/user-edit.png')),
                  title: Transform.translate(
                    offset: const Offset(-2, -3),
                    child: const Text(
                      'My Profile',
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
                      'Your profile and personal information',
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
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: ListTile(
                  onTap: () {
                    Get.to(Security());
                  },
                  leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 206, 231, 244),
                          border:
                              Border.all(width: 0.6, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset('assets/security.png')),
                  title: Transform.translate(
                    offset: const Offset(-2, -3),
                    child: const Text(
                      'Security',
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
                      'Manage how you access your account',
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
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: ListTile(
                  onTap: () {
                    Get.to(Settings());
                  },
                  leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 206, 231, 244),
                          border:
                              Border.all(width: 0.6, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset('assets/preferences.png')),
                  title: Transform.translate(
                    offset: const Offset(-2, -3),
                    child: const Text(
                      'Preferences',
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
                      'Settings and Configuration',
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
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: ListTile(
                  onTap: () {
                    Get.to(Legal());
                  },
                  leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 206, 231, 244),
                          border:
                              Border.all(width: 0.6, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset('assets/preferences.png')),
                  title: Transform.translate(
                    offset: const Offset(-2, -3),
                    child: const Text(
                      'Legal',
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
                      'Privacy Policy and T&C',
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
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 2),
                child: ListTile(
                  onTap: () {
                    _showMyDialog();
                  },
                  leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 206, 231, 244),
                          border:
                              Border.all(width: 0.6, color: Colors.transparent),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset('assets/exit.png')),
                  title: Transform.translate(
                    offset: const Offset(-2, -3),
                    child: const Text(
                      'Logout',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Gilroy Medium',
                      ),
                    ),
                  ),
                  subtitle: Transform.translate(
                    offset: const Offset(-2, -3),
                    child: const Text(
                      'Exit the app',
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
              // _buildProfileOption(Icons.person, 'My Profile',
              //     'Your profile and personal information'),
              // _buildProfileOption(
              //     Icons.lock, 'Security', 'Manage how you access your account'),
              // _buildProfileOption(
              //     Icons.settings, 'Preferences', 'Settings and configurations'),
              // _buildProfileOption(
              //     Icons.description, 'Legal', 'Privacy Policy and T&C'),
              // _buildProfileOption(Icons.logout, 'Logout', 'Exit the app',
              //     isLogout: true),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption(IconData icon, String title, String subtitle,
      {bool isLogout = false}) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: isLogout ? Colors.red : Colors.black),
        title: Text(title,
            style: TextStyle(color: isLogout ? Colors.red : Colors.black)),
        subtitle: Text(subtitle),
        onTap: () {
          // Handle tap
        },
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(32.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              height: 250,
              width: 400,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'Gilroy Bold',
                    ),
                  ),
                  const Text(
                    'oh no you are leaving...',
                    style: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'Gilroy Bold',
                      fontSize: 15,
                    ),
                  ),
                  const Text(
                    'Are you sure?',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Gilroy Bold',
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 200,
                    child: OutlinedButton(
                      onPressed: () {
                        Get.to(Login());
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      child: const Text(
                        'Yes, Log me out',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontFamily: 'Gilroy Medium'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    width: 200,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      child: const Text(
                        'No,Just Kidding',
                        style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontFamily: 'Gilroy Medium'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
