import 'package:app_echiquier/models/board.dart';
import 'package:app_echiquier/models/cell.dart';
import 'package:app_echiquier/ui/cell_widget.dart';
import 'package:flutter/material.dart';

class BoardWidget extends StatefulWidget {
  const BoardWidget({Key? key}) : super(key: key);

  @override
  State<BoardWidget> createState() => BoardWidgetState();
}

class BoardWidgetState extends State<BoardWidget> {
  List<List<String>> board =
      List.generate(8, (_) => List.generate(8, (_) => ''));

  @override
  void initState() {
    super.initState();
    initializeBoard();
  }

  void initializeBoard() {
    board[0] = ['r', 'n', 'b', 'q', 'k', 'b', 'n', 'r'];
    board[1] = ['p', 'p', 'p', 'p', 'p', 'p', 'p', 'p'];
    board[6] = ['P', 'P', 'P', 'P', 'P', 'P', 'P', 'P'];
    board[7] = ['R', 'N', 'B', 'Q', 'K', 'B', 'N', 'R'];
    for (int i = 2; i < 6; i++) {
      board[i] = List.generate(8, (_) => '');
    }
  }

  String getAssetPath(String piece) {
    if (piece.isEmpty) return '';
    String color = piece == piece.toUpperCase() ? 'white' : 'black';
    String type;
    switch (piece.toLowerCase()) {
      case 'r':
        type = 'rook';
        break;
      case 'n':
        type = 'knight';
        break;
      case 'b':
        type = 'bishop';
        break;
      case 'q':
        type = 'queen';
        break;
      case 'k':
        type = 'king';
        break;
      case 'p':
        type = 'pawn';
        break;
      default:
        type = '';
    }
    return 'assets/images/figures/$color/$type.png';
  }

  void updateBoard(int beforeX, int beforeY, int afterX, int afterY) {
    setState(() {
      board[afterY][afterX] = board[beforeY][beforeX];
      board[beforeY][beforeX] = '';
    });
  }

  // List<CellWidget> _buildCells(BuildContext context) {
  //   final List<CellWidget> cellWidgets = [];

  //   for (var cellList in widget.board.cells) {
  //     for (var cell in cellList) {
  //       cellWidgets.add(CellWidget(
  //         cell: cell,
  //         isSelected:
  //             widget.selectedCell != null && widget.selectedCell! == cell,
  //         isAvailable:
  //             widget.availablePositionsHash.contains(cell.positionHash),
  //       ));
  //     }
  //   }

  //   return cellWidgets;
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          maxWidth: MediaQuery.of(context).size.width),
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 8),
        itemBuilder: (context, index) {
          int x = index % 8;
          int y = index ~/ 8;
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: (x + y) % 2 == 0 ? Colors.white : Colors.black,
            ),
            child: Center(
              child: board[y][x].isNotEmpty
                  ? Image.asset(getAssetPath(board[y][x]))
                  : Container(),
            ),
          );
        },
        itemCount: 64,
      ),
    );
    //  Container(
    //   decoration: const BoxDecoration(
    //       border: Border(
    //     top: BorderSide(color: Color(0xFF57624A), width: 16),
    //     bottom: BorderSide(color: Color(0xFF57624A), width: 16),
    //   )),
    //   child: AspectRatio(
    //     aspectRatio: 1,
    //     child: GridView.count(
    //       padding: const EdgeInsets.all(0),
    //       crossAxisCount: boardSize,
    //       children: _buildCells(context),
    //     ),
    //   ),
    // );
  }
}
