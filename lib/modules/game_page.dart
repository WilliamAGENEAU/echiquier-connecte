import 'package:app_echiquier/config/colors.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_chess_board/flutter_chess_board.dart';

class ChessPage extends StatefulWidget {
  const ChessPage({super.key});

  @override
  _ChessPageState createState() => _ChessPageState();
}

class _ChessPageState extends State<ChessPage> {
  ChessBoardController controller = ChessBoardController();
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    listenToMoves();
  }

  void listenToMoves() {
    firestore.collection('Jeu1').snapshots().listen((snapshot) {
      for (var doc in snapshot.docChanges) {
        if (doc.type == DocumentChangeType.added) {
          var data = doc.doc.data();

          String positionBefore = "1" + "1";
          // data!['positionBeforeX'] + data['positionBeforeY'];
          print("ICI ========= " + positionBefore);
          String positionAfter = "1" + "2";
          // data['positionAfterX'] + data['positionAfterY'];
          setState(() {
            controller.makeMove(from: "1", to: "2");
            print("LA");
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        title: const Text('Échiquier connecté'),
      ),
      drawer: Drawer(
        backgroundColor: AppColors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: AppColors.black,
              ),
              child: Text(
                'Niveau de difficulté',
                style: TextStyle(
                  color: AppColors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              title: const Text('Facile'),
              leading: const Icon(Icons.sentiment_very_satisfied),
              onTap: () {
                // GetIt.I<GameCubit>().setAILevel(AILevel.easy);
                Navigator.pop(context);
              },
              // selected: GetIt.I<GameCubit>().state.aiLevel == AILevel.easy,
            ),
            ListTile(
              title: const Text('Moyen'),
              leading: const Icon(Icons.sentiment_neutral),
              onTap: () {
                // GetIt.I<GameCubit>().setAILevel(AILevel.medium);
                Navigator.pop(context);
              },
              // selected: GetIt.I<GameCubit>().state.aiLevel == AILevel.medium,
            ),
            ListTile(
              title: const Text('Difficile'),
              leading: const Icon(Icons.sentiment_very_dissatisfied),
              onTap: () {
                // GetIt.I<GameCubit>().setAILevel(AILevel.hard);
                Navigator.pop(context);
              },
              // selected: GetIt.I<GameCubit>().state.aiLevel == AILevel.hard,
            ),
          ],
        ),
      ),
      body: Center(
        child: ChessBoard(
          controller: controller,
          boardColor: BoardColor.darkBrown,
          boardOrientation: PlayerColor.white,
        ),
      ),
    );
  }
}
