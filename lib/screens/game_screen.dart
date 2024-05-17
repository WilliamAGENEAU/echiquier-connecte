import 'package:app_echiquier/bloc/cubits/game_cubit.dart';
import 'package:app_echiquier/bloc/states/game_state.dart';
import 'package:app_echiquier/config/colors.dart';
import 'package:app_echiquier/ui/board_widget.dart';
import 'package:app_echiquier/ui/lost_figures_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

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
          return Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LostFiguresWidget(figures: state.board.blackLost.figures),
                BoardWidget(
                  availablePositionsHash: state.availablePositionsHash,
                  board: state.board,
                  selectedCell: state.selectedCell,
                ),
                LostFiguresWidget(figures: state.board.whiteLost.figures),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              // Action pour la prise de pion
              print('Prise de Pion');
            },
            backgroundColor: const Color(
                0xFFB2D3BE), // Couleur dérivée de la couleur primaire
            tooltip: 'Prise de Pion',
            child: const Icon(Icons.ads_click),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              // Action pour la promotion
              print('Promotion');
            },
            backgroundColor: const Color(
                0xFF8BAE8E), // Couleur dérivée de la couleur primaire
            tooltip: 'Promotion',
            child: const Icon(Icons.arrow_upward),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () {
              // Action pour le roque
              print('Roque');
            },
            backgroundColor: const Color(0xFF57624A), // Couleur primaire
            tooltip: 'Roque',
            child: const Icon(Icons.king_bed),
          ),
        ],
      ),
    );
  }
}
