import 'package:flutter/material.dart';

class CoinList extends StatelessWidget {
  final String about;
  final double fee;
  final String img;
  final String name;
  final String cotation;
  final String simbols;

  const CoinList({
    Key? key,
    required this.about,
    required this.fee,
    required this.img,
    required this.name,
    required this.cotation,
    required this.simbols,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(img),
      ),
      title: Text(
        name,
        style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
      ),
      subtitle: Text(
        "R\$ $cotation",
        style: TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
      ),
      trailing: Text(
        simbols,
        style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'Montserrat'),
      ),
      children: [
        ListTile(
          title: Text(
            'About:',
            style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
          ),
          subtitle: Text(about),
        ),
        ListTile(
          title: Text(
            'FEE:',
            style: TextStyle(fontSize: 20, fontFamily: 'Montserrat'),
          ),
          subtitle: Text('R\$ ${fee}'),
        ),
      ],
    );
  }
}
