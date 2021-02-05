import 'package:box_me_up/main.dart';
import 'package:box_me_up/views/game-view/services/game-layout.dart';
import 'package:box_me_up/views/game-view/services/game.dart';
import 'package:box_me_up/views/game-view/services/game.enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:box_me_up/views/game-view/game-view.dart';

class TurnIndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Game>(
        builder: (context, game, child) {
          if (game.winner != Player.none) return getWinnerDisplay(game, context);

          return this.getCurrentPlayerDisplay(game);
        },
    );
  }

  getWinnerDisplay(Game game, BuildContext context) {
    String winnerPlayer = GameLayout.getPlayerName(game.winner, game.aiType != AITypes.none);
    Color color = GameLayout.getPlayerColor(game.winner);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          winnerPlayer + ' has won !',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.bold,
            fontSize: 22
          ),
        ),
        Container(height: 10),
        ElevatedButton(
          onPressed: () {
            Navigator.popAndPushNamed(context, GameView.routeName, arguments: GameViewArguments(game.gridSize, game.aiType));
          },
          child: Text('Play again'.toUpperCase()),
        )
      ],
    );
  }

  getCurrentPlayerDisplay(Game game) {
    String currentPlayer = GameLayout.getPlayerName(game.currentPlayer, game.aiType != AITypes.none);
    Color color = GameLayout.getPlayerColor(game.currentPlayer);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          currentPlayer + ' need to play',
          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 22),
        ),
      ],
    );
  }
}