import 'package:criptowallet/models/wallet_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Repository {
  Future<List<Wallet>> getWallet() async {
    List<Wallet> walletList = [];

    final String jsonData =
        await rootBundle.loadString('json/criptomoedas.json');
    final data = await json.decode(jsonData).toList();
    for (var i = 0; i < data; i++) {
      walletList.add(Wallet.fromJson(data[i]));
    }
    return walletList;
  }

  Future<List<Data>> getCoins(String wallet_id) async {
    final jsonData = await rootBundle.loadString('json/criptomoedas.json');
    final coin = json.decode(jsonData) as List<dynamic>;

    return coin.map((e) => Data.fromJson(e)).toList();
  }
}
