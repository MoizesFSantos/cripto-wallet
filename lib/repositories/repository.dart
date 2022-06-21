import 'package:criptowallet/models/wallet_model.dart';
import 'package:flutter/services.dart' as rootBundle;
import 'dart:convert';

class Repository {
  Future<List<Wallet>> getWallet() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('json/criptomoedas.json');
    final list = json.decode(jsonData) as List<dynamic>;

    return list.map((e) => Wallet.fromJson(e)).toList();
  }
}
