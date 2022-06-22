import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final String title;
  final String walletId;

  const Header({Key? key, required this.title, required this.walletId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.12,
      color: Colors.yellow[600],
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
            Text(
              walletId,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
