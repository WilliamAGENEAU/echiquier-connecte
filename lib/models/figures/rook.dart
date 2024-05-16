import 'package:app_echiquier/models/cell.dart';
import 'package:app_echiquier/models/cell_calculator.dart';
import 'package:app_echiquier/models/figure.dart';
import 'package:app_echiquier/models/figure_types.dart';
import 'package:app_echiquier/models/game_colors.dart';

class Rook extends Figure {
  Rook({required GameColors color, required Cell cell})
      : super(color: color, cell: cell, type: FigureTypes.rook);

  @override
  bool availableForMove(Cell to) {
    if (!super.availableForMove(to)) return false;
    return CellCalculator.hasWayForRook(cell, to);
  }
}
