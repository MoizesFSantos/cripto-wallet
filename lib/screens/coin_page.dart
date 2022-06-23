// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:criptowallet/components/coins_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CoinPage extends StatefulWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  State<CoinPage> createState() => _CoinPageState();
}

class _CoinPageState extends State<CoinPage> {
  List coins = [];
  //List<Wallet> _walletList = [];
  //List wallet = [];
  // var walletController = WalletController(Repository());
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('json/criptomoedas.json');
    final data = await json.decode(response);

    setState(() {
      coins = data['data'];
    });
  }

  @override
  void initState() {
    super.initState();
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.indigo[500],
        centerTitle: true,
        title: Text(
          'CRIPTOMOEDAS',
          style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
        ),
      ),
      body: Column(
        children: [
          // Header(title: 'Wallet ID:', walletId: 'c0inS-13435-2342-zksh-34556'),
          Expanded(
            child: ListView.separated(
                itemBuilder: (BuildContext context, index) {
                  return CoinList(
                      detail: coins[index]['details']['about'],
                      img: coins[index]['image_url'],
                      name: coins[index]['currency_name'],
                      cotation: coins[index]['cotation'],
                      simbols: coins[index]['symbol']);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 0.5,
                    height: 0.5,
                  );
                },
                itemCount: coins.length),
          ),
        ],
      ),
    );
  }
}
