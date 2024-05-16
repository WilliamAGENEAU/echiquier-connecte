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
              onTap: () {
                // GetIt.I<GameCubit>().setAILevel(AILevel.easy);
                Navigator.pop(context);
              },
              // selected: GetIt.I<GameCubit>().state.aiLevel == AILevel.easy,
            ),
            ListTile(
              title: const Text('Moyen'),
              onTap: () {
                // GetIt.I<GameCubit>().setAILevel(AILevel.medium);
                Navigator.pop(context);
              },
              // selected: GetIt.I<GameCubit>().state.aiLevel == AILevel.medium,
            ),
            ListTile(
              title: const Text('Difficile'),
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
              LostFiguresWidget(figures: state.board.blackLost.figures),
              BoardWidget(
                availablePositionsHash: state.availablePositionsHash,
                board: state.board,
                selectedCell: state.selectedCell,
              ),
              LostFiguresWidget(figures: state.board.whiteLost.figures),
            ],
          );
        },
      ),
    );
  }
}
