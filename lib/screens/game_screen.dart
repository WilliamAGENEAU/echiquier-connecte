import 'package:app_echiquier/bloc/cubits/game_cubit.dart';
import 'package:app_echiquier/bloc/states/game_state.dart';
import 'package:app_echiquier/config/colors.dart';
import 'package:app_echiquier/ui/board_widget.dart';
import 'package:app_echiquier/ui/lost_figures_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final GlobalKey<BoardWidgetState> boardKey = GlobalKey<BoardWidgetState>();

  @override
  void initState() {
    super.initState();
    _firestore.collection('Jeu1').snapshots().listen((snapshot) {
      for (var doc in snapshot.docs) {
        var data = doc.data();
        // Assuming 'turn1' and 'turn2' documents have the fields
        int posXBefore = int.parse(data['positionBeforeX']);
        int posYBefore = int.parse(data['positionBeforeY']);
        int posXAfter = int.parse(data['positionAfterX']);
        int posYAfter = int.parse(data['positionAfterY']);

        // Update the chessboard here based on these values
        // You need to implement the updateBoard method in your board widget
        boardKey.currentState
            ?.updateBoard(posXBefore, posYBefore, posXAfter, posYAfter);
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
                color: Color(0xFF57624A),
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
      body: BlocBuilder<GameCubit, GameState>(
        bloc: GetIt.I<GameCubit>(),
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // LostFiguresWidget(figures: state.board.blackLost.figures),
              BoardWidget(
                key: boardKey,
                // availablePositionsHash: state.availablePositionsHash,
                // board: state.board,
                // selectedCell: state.selectedCell,
              ),
              // LostFiguresWidget(figures: state.board.whiteLost.figures),
            ],
          );
        },
      ),
    );
  }
}
