// ignore_for_file: prefer_const_constructors
import 'package:criptowallet/components/coins_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:criptowallet/repositories/repository.dart';

class CoinPage extends StatelessWidget {
  const CoinPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<Repository>().fetchData;

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
      body: Consumer<Repository>(
        builder: (context, value, child) {
          return value.map.length == 0 && !value.error
              ? CircularProgressIndicator()
              : value.error
                  ? Text(
                      'Ops, something went wrong. ${value.errorMessage}',
                      textAlign: TextAlign.center,
                    )
                  : ListView.separated(
                      itemBuilder: (BuildContext context, index) {
                        return CoinList(
                          about: value.map['data'][index]['details']['about'],
                          fee: value.map['data'][index]['details']['fee'],
                          img: value.map['data'][index]['image_url'],
                          name: value.map['data'][index]['currency_name'],
                          cotation: value.map['data'][index]['cotation'],
                          simbols: value.map['data'][index]['symbol'],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          thickness: 0.5,
                          height: 0.5,
                        );
                      },
                      itemCount: value.map['data'].length);
        },
      ),
    );
  }
}
