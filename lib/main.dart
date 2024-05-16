import 'package:app_echiquier/bloc/app_blocs.dart';
import 'package:app_echiquier/screens/game_screen.dart';
import 'package:flutter/material.dart';

void main() {
  createAppBlocs();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'App échiquier connecté',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GameScreen(),
    );
  }
}
