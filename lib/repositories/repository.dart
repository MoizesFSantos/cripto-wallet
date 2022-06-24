import 'package:criptowallet/models/wallet_model.dart';
import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/cripto_model.dart';

class Repository {
  Future<Wallet> readWallet() async {
    final jsonData = await rootBundle.loadString('json/criptomoedas.json');
    final wallet = json.decode(jsonData);
    return wallet;
  }

  static Future<Data> getCoins(BuildContext context) async {
    final assetBundle = DefaultAssetBundle.of(context);
    final jsonData = await assetBundle.loadString('json/criptomoedas.json');
    final data = json.decode(jsonData);
    final coin = data['data'];
    return coin;
    //return coin.map<Data>((e) => Data.fromJson(e)).toList();
  }
}
