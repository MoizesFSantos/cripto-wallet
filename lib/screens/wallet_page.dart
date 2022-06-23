import 'dart:convert';

import 'package:criptowallet/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pie_chart/pie_chart.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({Key? key}) : super(key: key);

  @override
  State<WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  var wallet;
  int index = 0;
  double totalCarteira = 0;
  double saldo = 0;
  late Repository carteira;

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('json/criptomoedas.json');
    final data = await json.decode(response);

    setState(() {
      wallet = data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    readJson();
  }

  Map<String, double> dataMap = {
    "Bitcoin": 5,
    "Ethereum": 3,
  };

  final colorList = <Color>[
    Colors.indigo,
    Color.fromARGB(255, 121, 136, 203),
  ];

  @override
  Widget build(BuildContext context) {
    //carteira = context.watch<Repository>();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
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
                          'c0inS-13435-2342-zksh-34556',
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
                            'R\$15.455',
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
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: PieChart(
                  dataMap: dataMap,
                  chartType: ChartType.ring,
                  chartValuesOptions: ChartValuesOptions(
                    showChartValuesInPercentage: true,
                  ),
                  baseChartColor: Colors.grey[600]!.withOpacity(0.15),
                  colorList: colorList,
                  totalValue: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
