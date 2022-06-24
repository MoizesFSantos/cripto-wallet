import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

// ignore: must_be_immutable
class Graphic extends StatefulWidget {
  @override
  State<Graphic> createState() => _GraphicState();
}

class _GraphicState extends State<Graphic> {
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
    return Card(
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
    );
  }
}
