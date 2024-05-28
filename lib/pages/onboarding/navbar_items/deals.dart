import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Deals extends StatefulWidget {
  const Deals({super.key});

  @override
  State<Deals> createState() => _DealsState();
}

class _DealsState extends State<Deals> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to Deals Page',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}
