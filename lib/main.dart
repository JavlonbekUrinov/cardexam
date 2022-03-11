import 'package:flutter/material.dart';

import 'pages/add_page.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CardsPage(),
      routes: {
        CardsPage.id: (context) => CardsPage(),
        AddCardPage.id: (context) => AddCardPage(),
      },
    );
  }
}