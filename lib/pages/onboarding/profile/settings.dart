import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool darkMode = false;
  bool emailNotification = true;
  bool pushNotification = true;
  bool smsNotification = false;
  bool twoFactorAuth = true;
  bool switchValue = false;
  late FirebaseMessaging firebaseMessaging;
  Future<PermissionStatus> status = Permission.notification.status;

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Preferences',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Theme',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Transform.scale(
                scale: 0.8,
                child: Switch(
                  focusColor: Colors.grey,
                  inactiveTrackColor: Colors.grey[200],
                  activeColor: Colors.lightBlue,
                  trackOutlineColor:
                      MaterialStatePropertyAll(Colors.transparent),
                  value: darkMode,
                  onChanged: (bool value) {
                    setState(() {
                      darkMode = value;
                    });
                  },
                ),
              ),
              title: Text('Dark Mode',
                  style: TextStyle(
                    fontFamily: 'Gilroy Bold',
                  )),
              subtitle: Text('Use dark mode theme',
                  style: TextStyle(
                    fontFamily: 'Gilroy Medium',
                  )),
              contentPadding: EdgeInsets.zero,
            ),
            SizedBox(height: 20),
            Text(
              'Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Transform.scale(
                scale: 0.8,
                child: Switch(
                  focusColor: Colors.grey,
                  inactiveTrackColor: Colors.grey[200],
                  activeColor: Colors.lightBlue,
                  trackOutlineColor:
                      MaterialStatePropertyAll(Colors.transparent),
                  value: emailNotification,
                  onChanged: (bool value) {
                    setState(() {
                      emailNotification = value;
                    });
                  },
                ),
              ),
              title: Text('Email',
                  style: TextStyle(
                    fontFamily: 'Gilroy Bold',
                  )),
              subtitle: Text('Get notifications via email',
                  style: TextStyle(
                    fontFamily: 'Gilroy Medium',
                  )),
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              leading: Transform.scale(
                scale: 0.8,
                child: Switch(
                  focusColor: Colors.grey,
                  inactiveTrackColor: Colors.grey[200],
                  activeColor: Colors.lightBlue,
                  trackOutlineColor:
                      MaterialStatePropertyAll(Colors.transparent),
                  value: pushNotification,
                  onChanged: (value) async {
                    if (await status.isDenied) {
                      // Notification permission is denied
                      setState(() {
                        switchValue = value;
                        AppSettings.openAppSettings(
                            type: AppSettingsType.notification);
                      });
                      if (kDebugMode) {
                        print(Permission.notification.status);
                      }
                    } else if (await status.isGranted) {
                      // Notification permission is granted
                      setState(() {
                        switchValue = value;
                        AppSettings.openAppSettings(
                            type: AppSettingsType.notification);
                      });
                      if (kDebugMode) {
                        print(Permission.notification.status);
                      }
                    }
                  },
                ),
              ),
              title: Text('Push Notification',
                  style: TextStyle(
                    fontFamily: 'Gilroy Bold',
                  )),
              subtitle: Text('Get push notifications',
                  style: TextStyle(
                    fontFamily: 'Gilroy Medium',
                  )),
              contentPadding: EdgeInsets.zero,
            ),
            ListTile(
              leading: Transform.scale(
                scale: 0.8,
                child: Switch(
                  focusColor: Colors.grey,
                  inactiveTrackColor: Colors.grey[200],
                  activeColor: Colors.lightBlue,
                  trackOutlineColor:
                      MaterialStatePropertyAll(Colors.transparent),
                  value: smsNotification,
                  onChanged: (bool value) {
                    setState(() {
                      smsNotification = value;
                    });
                  },
                ),
              ),
              title: Text('SMS',
                  style: TextStyle(
                    fontFamily: 'Gilroy Bold',
                  )),
              subtitle: Text('Get notifications via SMS (Charges may apply)',
                  style: TextStyle(
                    fontFamily: 'Gilroy Medium',
                  )),
              contentPadding: EdgeInsets.zero,
            ),
            SizedBox(height: 20),
            Text(
              'Security',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ListTile(
              leading: Transform.scale(
                scale: 0.8,
                child: Switch(
                  focusColor: Colors.grey,
                  inactiveTrackColor: Colors.grey[200],
                  activeColor: Colors.lightBlue,
                  trackOutlineColor:
                      MaterialStatePropertyAll(Colors.transparent),
                  value: twoFactorAuth,
                  onChanged: (bool value) {
                    setState(() {
                      twoFactorAuth = value;
                    });
                  },
                ),
              ),
              title: Text('2FA',
                  style: TextStyle(
                    fontFamily: 'Gilroy Bold',
                  )),
              subtitle: Text('Use 2FA for authorizing transactions',
                  style: TextStyle(
                    fontFamily: 'Gilroy Medium',
                  )),
              contentPadding: EdgeInsets.zero,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Get.to();
                },
                child: Text('Confirm',
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
          ],
        ),
      ),
    );
  }
}
