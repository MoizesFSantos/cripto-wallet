import 'package:criptowallet/models/wallet_model.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class Repository {
  Future<Wallet> readWallet() async {
    final jsonData = await rootBundle.loadString('json/criptomoedas.json');
    final wallet = json.decode(jsonData);
    return wallet;
  }

  Future<List<Data>> getCoins(String wallet_id) async {
    final jsonData = await rootBundle.loadString('json/criptomoedas.json');
    final coin = json.decode(jsonData) as List<dynamic>;

    return coin.map((e) => Data.fromJson(e)).toList();
  }
}
