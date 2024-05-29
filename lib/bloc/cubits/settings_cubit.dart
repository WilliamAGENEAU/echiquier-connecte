import 'package:app_echiquier/bloc/states/settings_state.dart';
import 'package:app_echiquier/models/board.dart';
import 'package:app_echiquier/models/lost_figures.dart';
import 'package:app_echiquier/models/player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(SettingsState initialState) : super(initialState);

  factory SettingsCubit.initial() {
    final board =
        Board(cells: [], whiteLost: LostFigures(), blackLost: LostFigures());
    board.createCells();
    board.putFigures();

    return SettingsCubit(SettingsState(
      whitePlayer: Player.human(),
      blackPlayer: Player.ai(),
      difficulty: 1,
    ));
  }
}
