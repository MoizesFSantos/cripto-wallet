import 'package:criptowallet/models/wallet_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

void main() {
  test('deve retornar wallet', () {
    Future<List<Wallet>> getWallet() async {
      List<Wallet> walletList = [];

      final String jsonData =
          await rootBundle.loadString('json/criptomoedas.json');
      final data = await json.decode(jsonData).toList();
      for (var i = 0; i < data; i++) {
        walletList.add(Wallet.fromJson(data[i]));
      }
      print(walletList[0].message);
      return walletList;
    }
  });

  test('deve retornar lista de moedas', () async {
    final jsonData = await rootBundle.loadString('json/criptomoedas.json');
    var coin = json.decode(jsonData) as List<dynamic>;
    coin.map((e) => Data.fromJson(e)).toList();
    print(coin.length);
  });
}
