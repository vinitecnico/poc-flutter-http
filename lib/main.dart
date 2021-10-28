import 'package:flutter/material.dart';
import 'package:poc_byte_bank_v2/screens/dashboard.dart';

void main() {
  runApp(const ByteBankApp());
}

class ByteBankApp extends StatelessWidget {
  const ByteBankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Colors.green[900],
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.blueAccent[700],
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.blueAccent[700],
            textTheme: ButtonTextTheme.primary,
          )),
      home: const Dashboard(),
    );
  }
}
