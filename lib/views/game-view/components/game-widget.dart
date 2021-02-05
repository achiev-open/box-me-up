import 'package:box_me_up/main.dart';
import 'package:box_me_up/views/game-view/services/game-layout.dart';
import 'package:box_me_up/views/game-view/services/game.dart';
import 'package:box_me_up/views/game-view/services/game.enums.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:provider/provider.dart';
import 'dart:async';

class GameWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GameWidgetState();
}

class GameWidgetState extends State<GameWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Game> (
      builder: (context, game, child) {
        if (game.winner == Player.none && game.aiType != AITypes.none && game.currentPlayer == Player.second) {
          Future.delayed(Duration(seconds: 1), () {
              game.makeAiAction();
          });
        }
        return LayoutBuilder(builder: (context, constraints) {
          List<Widget> gameElements = [];
          gameElements.addAll(GameLayout.buildWonSquaresWidgets(constraints, game));
          gameElements.addAll(GameLayout.buildLinesWidgets(constraints, game));
          gameElements.addAll(GameLayout.buildDotsGridWidgets(constraints, game));

          return SizedBox(
            width: constraints.maxWidth,
            height: constraints.maxWidth,
            child: Stack(
              children: gameElements,
            ),
          );
        });
      },
    );
  }
}