import 'package:flutter/material.dart';
import 'AuthScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(background: Colors.white),
        fontFamily: 'Ubuntu',),
      home: AuthScreen(),
    );
  }
}