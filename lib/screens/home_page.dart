// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:criptowallet/components/coins_list.dart';
import 'package:criptowallet/components/header.dart';
import 'package:criptowallet/controllers/wallet_controller.dart';
import 'package:criptowallet/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List coins = [];
  //List wallet = [];

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

  // var wallet = walletController.fetchWallet();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.yellow[600],
        centerTitle: true,
        title: Text(
          'HOME',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Header(title: 'Wallet ID:', walletId: 'c0inS-13435-2342-zksh-34556'),
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
