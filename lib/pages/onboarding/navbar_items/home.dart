import 'package:bitbust/model/provider/user_provider.dart';

import 'package:bitbust/utilities/functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserController userController = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          greeting(),
          style: TextStyle(
              color: Colors.black, fontFamily: 'Gilroy Medium', fontSize: 17),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.white,
          child: Text(''),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
          CircleAvatar(
            backgroundColor: Colors.grey[300],
            radius: 12,
          ),
          SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Balance',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Gilroy Medium')),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Text(
                            '₦ 0.00',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Gilroy Medium'),
                          ),
                        ),
                        DropdownButton<String>(
                          value: 'NGN',
                          dropdownColor: Colors.black,
                          items: <String>['NGN', 'USD'].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Gilroy Medium'),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionIcon(Icons.shopping_cart, 'Buy Crypto'),
                  _buildActionIcon(Icons.upload, 'Sell Crypto'),
                  _buildActionIcon(Icons.swap_horiz, 'Swap'),
                  _buildActionIcon(Icons.download, 'Deposit'),
                  _buildActionIcon(Icons.money_off, 'Withdraw'),
                ],
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('BTC',
                        style: TextStyle(
                            fontSize: 18, fontFamily: 'Gilroy Medium')),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('0.00000045',
                            style: TextStyle(fontFamily: 'Gilroy Medium')),
                        Text('3.8%',
                            style: TextStyle(
                                color: Colors.green,
                                fontFamily: 'Gilroy Medium')),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('Recommended',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gilroy Medium')),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildRecommendationCard('BNB', '+1.37', '216.3'),
                  _buildRecommendationCard('ADL', '+2.72', '0.4976'),
                ],
              ),
              SizedBox(height: 20),
              Text('My Assets',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gilroy Medium')),
              SizedBox(height: 10),
              _buildAssetCard('Bitcoin', '\$4,500.00', '0.0000056 BTC', '-4.5%',
                  '\$12.5', Colors.red),
              _buildAssetCard('Tether', '\$2,200.00', '2,600 USDT', '+4.5%',
                  '\$12.5', Colors.green),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionIcon(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.black,
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(fontFamily: 'Gilroy Medium'),
        ),
      ],
    );
  }

  Widget _buildRecommendationCard(String name, String change, String value) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(name,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gilroy Medium')),
          Text(change,
              style: TextStyle(
                  color: change.contains('+') ? Colors.green : Colors.red,
                  fontFamily: 'Gilroy Medium')),
          Text(value),
        ],
      ),
    );
  }

  Widget _buildAssetCard(String name, String amount, String amountDetail,
      String change, String changeDetail, Color changeColor) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gilroy Medium')),
              Text(amountDetail),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(amount,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Gilroy Medium')),
              Row(
                children: [
                  Text(change,
                      style: TextStyle(
                          color: changeColor, fontFamily: 'Gilroy Medium')),
                  SizedBox(width: 5),
                  Text(changeDetail,
                      style: TextStyle(fontFamily: 'Gilroy Medium')),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
