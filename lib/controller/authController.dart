import 'dart:convert';
import 'dart:io';
import 'package:bitbust/configs/constants.dart';
import 'package:bitbust/model/user_model.dart';
import 'package:bitbust/navbar.dart';
import 'package:bitbust/pages/onboarding/authentication/login.dart';
import 'package:bitbust/pages/onboarding/authentication/verify_otp.dart';
import 'package:bitbust/pages/onboarding/navbar_items/profile.dart';
import 'package:bitbust/pages/onboarding/wallet/create_wallet_pin.dart';
import 'package:bitbust/utilities/functions.dart';
import 'package:bitbust/widgets/progress_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bitbust/widgets/alert.dart';

void register(BuildContext context, String firstName, String lastName,
    String email, String phone, String password, confirmPassword) async {
  if (firstName.isNotEmpty &&
      lastName.isNotEmpty &&
      email.isNotEmpty &&
      phone.isNotEmpty &&
      password.isNotEmpty) {
    // Check for email domain

    if (password != confirmPassword) {
      alert(context, 'error', 'Passwords do not match');
      return;
    }
    bool emailAllowed = checkEmailDomain(email);

    if (!emailAllowed) {
      // Email domain check
      alert(context, 'error', 'Email domain is not allowed');
      return;
    }

    String? emailValidation = validateEmail(email);

    if (emailValidation != null) {
      // Email not valid
      alert(context, 'error', emailValidation);
      return;
    }

    if (emailAllowed) {
      try {
        progressIndicator(context, message: 'Creating account');
        final response = await http.post(Uri.parse('$baseUrl/register'),
            body: jsonEncode({
              'first_name': firstName,
              'last_name': lastName,
              'email': email,
              'phone': phone,
              'password': password,
              'password_confirmation': confirmPassword,
              'phone_token': "090#992j",
            }),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            });

        if (response.statusCode == 200) {
          final Map<String, dynamic> responseBody = json.decode(response.body);
          if (responseBody.containsKey('message')) {
            String message = responseBody['message'];
            alert(context, 'success', message);
            // Get.to(Login());
            final prefs = await SharedPreferences.getInstance();
            prefs.setString('firstName', firstName);
            prefs.setString('lastName', lastName);
            prefs.setString('email', email);
            prefs.setString('phone', phone);
            Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pop();
              Get.to(const Login());
              // Get.to(() => VerifyOtp(email: email));
            });
          } else {
            // alert(context, 'error',
            //     'Response does not contain the "message" key');
          }
        } else {
          if (response.body.contains('error')) {
            alert(context, 'error', 'User already exists');
          }
        }
      } catch (e) {
        alert(context, 'error', 'An error occurred: $e');
      } finally {
        Navigator.of(context).pop();
      }
    } else {
      alert(context, 'error', 'Email domain is not allowed');
    }
  } else {
    alert(context, 'error', 'All fields are required');
  }
}

void login(BuildContext context, String email, String password) async {
  if (email.isNotEmpty && password.isNotEmpty) {
    bool emailAllowed = checkEmailDomain(email);

    if (!emailAllowed) {
      alert(context, 'error', 'Email domain is not allowed');
      return;
    }

    String? emailValidation = validateEmail(email);

    if (emailValidation != null) {
      // Email not valid
      alert(context, 'error', emailValidation);
      return;
    }

    if (emailAllowed) {
      try {
        progressIndicator(context, message: 'Loading');
        final response = await http.post(Uri.parse('$baseUrl/login'),
            body: jsonEncode({"email": email, "password": password}),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            });

        if (response.statusCode == 202) {
          final Map<String, dynamic> responseBody = json.decode(response.body);
          if (responseBody.containsKey('message')) {
            print(response.body);
            String message = responseBody['message'];
            alert(context, 'success', message);
            Future.delayed(Duration(seconds: 1), () {
              Navigator.of(context).pop();

              Get.to(() => VerifyOtp(email: email));
            });
            final prefs = await SharedPreferences.getInstance();

            prefs.setString('email', email);
            prefs.setString('password', password);
          } else {
            final Map<String, dynamic> responseBody =
                json.decode(response.body);
            print(response.body);
            String message = responseBody['message'];
            alert(context, 'error', message);
          }
        } else {
          final Map<String, dynamic> responseBody = json.decode(response.body);
          String message = responseBody['message'];
          print(response.body);
          alert(context, 'error', message);
        }
      } catch (e) {
        alert(context, 'error', 'An error occurred: $e');
      } finally {
        Navigator.of(context).pop();
      }
    } else {
      alert(context, 'error', 'Email domain is not allowed');
    }
  } else {
    alert(context, 'error', 'All fields are required');
  }
}

void setupBiometrics(BuildContext context) async {
  final LocalAuthentication auth = LocalAuthentication();
  final prefs = await SharedPreferences.getInstance();
  bool canCheckBiometrics = await auth.canCheckBiometrics;

  if (canCheckBiometrics) {
    var authenticated = await auth.authenticate(
      options: const AuthenticationOptions(
        biometricOnly: true,
        useErrorDialogs: true,
        stickyAuth: true,
      ),
      localizedReason: Platform.isIOS
          ? 'Sign In Using Face ID'
          : 'Sign In Using Fingerprint',
    );

    if (authenticated) {
      await prefs.setBool('authenticated', true);
      await prefs.setBool('biometrics_set', true);

      Get.to(const Navbar());
    } else {
      await prefs.setBool('biometrics_set', false);
    }
  } else {
    print('Biometrics not available');
  }
}

verifyEmail(BuildContext context, String token, String email) async {
  try {
    if (token != '') {
      progressIndicator(context, message: 'Verifying');
      final response = await http.post(Uri.parse('$baseUrl/verify-otp'),
          body: jsonEncode({
            'email': email,
            'otp': '123456',
          }),
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          });
      // print('Raw Response Body: ${response.body}');
      final Map<String, dynamic> responseBody = json.decode(response.body);
      if (response.statusCode == 200) {
        if (kDebugMode) {
          print('Raw Response Body: ${response.body}');
          String token = responseBody['data']['token'];

          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('token', token);
          print(token);
          Get.to(CreateWaletPin());
        }
        alert(context, 'success', responseBody['message']);
      } else {
        final message = responseBody['message'];
        Get.back();
        if (kDebugMode) {
          print('Raw Response Body: ${response.body}');
        }
        // Get.to(const CreateWaletPin());

        alert(context, 'error', message);
      }
    } else {
      alert(context, 'error', 'Token required');
    }
  } catch (e) {
    Get.back();
    alert(
        context, 'error', 'Whoops! Something went wrong, please contact Admin');
    throw Exception(e);
  }
}

forgotPassword(BuildContext context, String email) async {
  try {
    if (email.isNotEmpty) {
      progressIndicator(context, message: 'Requesting');
      final response = await http.post(
        Uri.parse('$baseUrl/forgot-password'),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'email': email,
        }),
      );
      if (kDebugMode) {
        print(email);
      }
      if (response.statusCode == 200) {
        Get.back();
        alert(context, 'success',
            'A reset OTP has been sent to your email provided it exists with us');
        // prefs.setString('email', email);
        // Get.to(const ResetPassword());
        if (kDebugMode) {
          print('Email sent successfully');
        }
      } else if (response.statusCode == 404) {
        Get.back();

        if (kDebugMode) {
          print('User not found');
        }
        alert(context, 'error', 'User not found');
      } else {
        Get.back();

        alert(context, 'error', 'Internal server error');
        if (kDebugMode) {
          print('Internal server error');
        }
      }
    } else {
      alert(context, 'error', 'Email is required!');
    }
  } catch (e) {
    Get.back();
    alert(
        context, 'error', 'Whoops! Something went wrong, please contact Admin');
    throw Exception(e);
  }
}

Future<User?> fetchUserData(String token) async {
  const url = '$baseUrl/user';
  final headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    'Authorization': 'Bearer $token',
  };

  final response = await http.get(
    Uri.parse(url),
    headers: headers,
  );

  if (response.statusCode == 200) {
    final Map<String, dynamic> responseBody = json.decode(response.body);
    User user = User.fromJson(responseBody['data']);

    // Save user details to local storage
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uuid', user.uuid);
    await prefs.setString('firstName', user.firstName);
    await prefs.setString('lastName', user.lastName);
    await prefs.setString('email', user.email);
    await prefs.setString('phone', user.phone);
    await prefs.setBool('is2faEnabled', user.is2faEnabled);
    // Save other user details as needed

    return user;
  } else {
    print('Failed to fetch user data: ${response.statusCode}');
    print('Response body: ${response.body}');
    return null;
  }
}