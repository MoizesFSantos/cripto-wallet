import 'package:flutter/material.dart';

class WalletComponent extends StatelessWidget {
  final String walletId;
  final String useBalance;

  const WalletComponent(
      {Key? key, required this.walletId, required this.useBalance})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Wallet id:',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  walletId,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Valor da Carteira:',
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 20,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    useBalance,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
