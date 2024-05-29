import 'package:app_echiquier/bloc/app_blocs.dart';
import 'package:app_echiquier/modules/game_page.dart';
import 'package:app_echiquier/screens/game_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      // home: const GameScreen(),
      home: const ChessPage(),
    );
  }
}
