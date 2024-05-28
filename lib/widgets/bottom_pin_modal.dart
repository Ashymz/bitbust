import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pin_put/pin_put.dart';

class ChangePin extends StatelessWidget {
  ChangePin({super.key});

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
                    'Change Transaction Pin',
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
                'Update your Trasaction Pin',
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontFamily: 'Gilroy Medium'),
              ),
              SizedBox(height: 20),
              Text(
                'Enter Old Pin',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontFamily: 'Gilroy Medium'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 10, 10, 0),
                child: PinPut(
                  pinAnimationType: PinAnimationType.slide,
                  textStyle: const TextStyle(
                      color: Colors.black, fontFamily: 'Medium', fontSize: 20),
                  fieldsCount: 4,
                  eachFieldWidth: 60.0,
                  eachFieldHeight: 60.0,
                  submittedFieldDecoration: _pinPutDecoration.copyWith(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  selectedFieldDecoration: _pinPutDecoration.copyWith(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  followingFieldDecoration: _pinPutDecoration.copyWith(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Enter New Pin',
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontFamily: 'Gilroy Medium'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 10, 10, 0),
                child: PinPut(
                  pinAnimationType: PinAnimationType.slide,
                  textStyle: const TextStyle(
                      color: Colors.black, fontFamily: 'Medium', fontSize: 20),
                  fieldsCount: 4,
                  eachFieldWidth: 60.0,
                  eachFieldHeight: 60.0,
                  submittedFieldDecoration: _pinPutDecoration.copyWith(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  selectedFieldDecoration: _pinPutDecoration.copyWith(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  followingFieldDecoration: _pinPutDecoration.copyWith(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
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

  final BoxDecoration _pinPutDecoration = BoxDecoration(
    border: Border(bottom: BorderSide(color: Colors.black, width: 2.0)),
  );

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
