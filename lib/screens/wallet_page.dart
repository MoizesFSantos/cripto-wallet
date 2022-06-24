import 'package:criptowallet/components/graphic.dart';
import 'package:criptowallet/components/wallet_component.dart';
import 'package:criptowallet/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class WalletPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<Repository>().fetchData;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.indigo[500],
        centerTitle: true,
        title: Text('CARTEIRA',
            style: TextStyle(color: Colors.white, fontFamily: 'Montserrat')),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 20),
        child: Consumer<Repository>(
          builder: (context, value, child) {
            return value.map.length == 0 && !value.error
                ? CircularProgressIndicator()
                : value.error
                    ? Text(
                        'Ops, something went wrong. ${value.errorMessage}',
                        textAlign: TextAlign.center,
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WalletComponent(
                              walletId: value.map['wallet_id'],
                              useBalance: 'R\$ ${value.map['user_balance']}'),
                          Graphic(),
                        ],
                      );
          },
        ),
      ),
    );
  }
}
