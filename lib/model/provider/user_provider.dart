import 'package:bitbust/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class UserController extends GetxController {
  Rx<User?> user = Rx<User?>(null);

  String greeting() {
    DateTime now = DateTime.now();
    int currentHour = now.hour;
    String greetingText = '';

    if (user.value != null) {
      String firstName = user.value!.firstName;
      if (currentHour >= 0 && currentHour < 12) {
        greetingText = 'Good Morning👋\n$firstName';
      } else if (currentHour >= 12 && currentHour < 18) {
        greetingText = 'Good Afternoon👋\n$firstName';
      } else {
        greetingText = 'Good Evening👋\n$firstName';
      }
    }

    return greetingText;
  }

  // Method to update user data
  void updateUser(User newUser) {
    user.value = newUser;
  }
}
