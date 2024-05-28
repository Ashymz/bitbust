bool checkEmailDomain(String email) {
  if (email.endsWith('@gmail.com') ||
      email.endsWith('@hotmail.com') ||
      email.endsWith('@yahoo.com')) {
    return true;
  } else {
    return true;
  }
}


String? validateEmail(String email) {
  final RegExp emailRegex =
      RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

  if (!emailRegex.hasMatch(email)) {
    return 'Invalid email format';
  }

  return null;
}


greeting() {
  DateTime now = DateTime.now();
  int currentHour = now.hour;
  String greeting;

  if (currentHour >= 0 && currentHour < 12) {
    greeting = 'Good Morning👋\nKolade Kolawole';
  } else if (currentHour >= 12 && currentHour < 18) {
    greeting = 'Good Afternoon👋\nKolade Kolawole ';
  } else {
    greeting = 'Good Evening👋\nKolade Kolawole ';
  }
  return greeting;
}