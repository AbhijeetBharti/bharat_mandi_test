import 'package:bharat_mandi_test/Screen/list_view_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bharat Mandi Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListViewScreen(),
    );
  }
}
