import 'package:akilli_kampus/core/extension/string_extension.dart';
import 'package:flutter/material.dart';


class BankaCard extends StatefulWidget {
  @override
  _BankaCardState createState() => _BankaCardState();
}

class _BankaCardState extends State<BankaCard> {
  String _randomCardNumber = '';
  String _expDate = '';
  String _cvv = '';
  double _balance = 500.0; // Initial balance

  @override
  void initState() {
    super.initState();
    generateRandomCardInfo();
  }

  void generateRandomCardInfo() {
    setState(() {
      _randomCardNumber = '1234 5678 9012 3456';
      _expDate = '12/25';
      _cvv = '123';
    });
  }

  void updateBalance(double newBalance) {
    setState(() {
      _balance = newBalance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.blueGrey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.blue[800],
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'DpuTakCard',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Image.asset(
                            'assets/images/DPUTAK LOGO.png',
                            height: 70,
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _randomCardNumber,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Bakiye: \₺$_balance',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Son Kullanma Tarihi: $_expDate',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'CVV: $_cvv',
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'Kart Sahibi: Arif UÇAR',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Limit: \₺2000',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                          Image.asset(
                            'sim'.toPNG,
                            height: 70,
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}