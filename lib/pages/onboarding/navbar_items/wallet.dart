import 'package:flutter/material.dart';

class Wallet extends StatefulWidget {
  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text(''),
        title: Text(
          'Wallet',
          style: TextStyle(
              fontFamily: 'Gilroy Bold',
              fontSize: 30,
              fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildBalanceCard(),
              SizedBox(height: 20),
              Text(
                'Transaction History',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy Medium'),
              ),
              SizedBox(height: 10),
              _buildTransactionHistory(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBalanceCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Balance',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: 'Gilroy Medium'),
              ),
              DropdownButton<String>(
                value: 'USD',
                dropdownColor: Colors.black,
                items: <String>['USD', 'EUR', 'NGN'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'Gilroy Medium'),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  // Handle currency change
                },
              ),
            ],
          ),
          SizedBox(height: 10),
          Text(
            '\$0.00',
            style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gilroy Medium'),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildActionButton('Transfer'),
              _buildActionButton('Deposit'),
              _buildActionButton('Swap'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(String label) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: ElevatedButton(
        onPressed: () {
          // Handle button press
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(label, style: TextStyle(fontFamily: 'Gilroy Medium')),
      ),
    );
  }

  Widget _buildTransactionHistory() {
    return Column(
      children: List.generate(5, (index) {
        return _buildTransactionTile(
          name: 'Janet Doe',
          amount: index % 2 == 0 ? 4500.00 : 2500.00,
          currency: 'BTC',
          cryptoAmount: '0.000045 BTC',
        );
      }),
    );
  }

  Widget _buildTransactionTile(
      {required String name,
      required double amount,
      required String currency,
      required String cryptoAmount}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 1,
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
              Text(
                name,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Gilroy Medium'),
              ),
              SizedBox(height: 4),
              Text(
                '$currency BNB',
                style:
                    TextStyle(color: Colors.grey, fontFamily: 'Gilroy Medium'),
              ),
              SizedBox(height: 4),
              Text(
                cryptoAmount,
                style:
                    TextStyle(color: Colors.grey, fontFamily: 'Gilroy Medium'),
              ),
            ],
          ),
          Text(
            '\$$amount',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                fontFamily: 'Gilroy Medium'),
          ),
        ],
      ),
    );
  }
}
