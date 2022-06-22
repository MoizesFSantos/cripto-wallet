import 'package:flutter/material.dart';

class CoinList extends StatelessWidget {
  final String detail;
  final String img;
  final String name;
  final String cotation;
  final String simbols;

  const CoinList({
    Key? key,
    required this.detail,
    required this.img,
    required this.name,
    required this.cotation,
    required this.simbols,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(detail)));
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.12,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(img),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "R\$ ${cotation}",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                simbols,
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
