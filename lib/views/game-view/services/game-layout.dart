import 'package:box_me_up/main.dart';
import 'package:box_me_up/views/game-view/services/game.dart';
import 'package:box_me_up/views/game-view/services/game.enums.dart';
import 'package:flutter/material.dart';


class GameLayout {
  static Color getPlayerColor(Player player, {bool highlight = false}) {
    Map<Player, Color> playerColors = {
      Player.none: Color(AchievTheme.white),
      Player.first: highlight ? Colors.blueAccent : Color(AchievTheme.blue),
      Player.second: highlight ? Colors.orange : Color(AchievTheme.orange),
    };
    return playerColors[player];
  }

  static getPlayerName(Player player, bool ai) {
    if (player == Player.first) {
      return ai ? 'You' : 'Player 1';
    } else {
      return ai ? 'AI' : 'Player 2';
    }
  }

  static double _getBlocSize(double maxWidth, int gridSize) {
    return ((maxWidth - 10) ~/ gridSize).toDouble();
  }

  static List<Widget> buildDotsGridWidgets(BoxConstraints constraints, Game game) {
    double blocSize = GameLayout._getBlocSize(constraints.maxWidth, game.gridSize);
    List<Widget> dotsGrid = [];

    for (int i = 0; i < game.gridSize + 1; i++) {
      for (int y = 0; y < game.gridSize + 1; y++) {
        Widget dot = Positioned(
            left: i * blocSize,
            top: y * blocSize,
            child: Container(
              width: 10,
              height: 10,
              decoration: BoxDecoration(
                  color: Color(AchievTheme.black),
                  shape: BoxShape.circle
              ),
            )
        );

        dotsGrid.add(dot);
      }
    }
    return dotsGrid;
  }

  static List<Widget> buildLinesWidgets(BoxConstraints constraints, Game game) {
    double blocSize = GameLayout._getBlocSize(constraints.maxWidth, game.gridSize);
    List<Widget> linesWidgets = [];

    bool humanPlayerTurn = game.aiType == AITypes.none || game.currentPlayer == Player.first;

    game.lines.forEach((Line line) {
      Color lineColor = line.owner == Player.none ? Colors.grey.withAlpha(50) : GameLayout.getPlayerColor(line.owner, highlight: line.id == game.lastLineId);

      Widget container = Container(
        width: line.direction == LineDirection.horizontal ? blocSize : 20,
        height: line.direction == LineDirection.vertical ? blocSize : 20,
        color: Colors.transparent,
        alignment: Alignment.center,
        child: Container(
          width: line.direction == LineDirection.horizontal ? blocSize : 5,
          height: line.direction == LineDirection.vertical ? blocSize : 5,
          color: lineColor,
        ),
      );

      Widget gestureDetector;
      if (line.owner == Player.none && humanPlayerTurn) {
        gestureDetector = GestureDetector(
          onTap: () { game.selectLine(line); },
          child: container,
        );
      }

      Widget lineWidget = Positioned(
        left: line.x * blocSize + (line.direction == LineDirection.vertical ? -5 : 5),
        top: line.y * blocSize + (line.direction == LineDirection.horizontal ? -5 : 5),
        child: gestureDetector ?? container,
      );

      linesWidgets.add(lineWidget);
    });

    return linesWidgets;
  }

  static List<Widget> buildWonSquaresWidgets(BoxConstraints constraints, Game game) {
    double blocSize = GameLayout._getBlocSize(constraints.maxWidth, game.gridSize);
    List<Widget> squaresWidgets = [];

    game.grid.forEach((Square square) {
      if (square.owner == Player.none) return;
      Widget squareWidget = Positioned(
          left: square.x * blocSize + 5,
          top: square.y * blocSize + 5,
          child: Container(
            width: blocSize,
            height: blocSize,
            color: GameLayout.getPlayerColor(square.owner).withAlpha(75),
          )
      );
      squaresWidgets.add(squareWidget);
    });

    return squaresWidgets;
  }
}