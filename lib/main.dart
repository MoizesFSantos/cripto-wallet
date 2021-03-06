import 'package:criptowallet/repositories/repository.dart';
import 'package:criptowallet/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: ChangeNotifierProvider(
          create: (context) => Repository(),
          builder: (context, child) {
            return HomePage();
          },
        ));
  }
}
