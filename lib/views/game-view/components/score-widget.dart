import 'package:box_me_up/main.dart';
import 'package:box_me_up/views/game-view/services/game-layout.dart';
import 'package:box_me_up/views/game-view/services/game.dart';
import 'package:box_me_up/views/game-view/services/game.enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ScoreWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Game>(
      builder: (context, game, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SingleScoreWidget(
                score: game.firstPlayerScore,
                name: GameLayout.getPlayerName(Player.first, game.aiType != AITypes.none),
                color: GameLayout.getPlayerColor(Player.first)
            ),
            SingleScoreWidget(
                score: game.secondPlayerScore,
                name: GameLayout.getPlayerName(Player.second, game.aiType != AITypes.none),
                color: GameLayout.getPlayerColor(Player.second)
            ),
          ],
        );
      },
    );
  }
}

class SingleScoreWidget extends StatelessWidget {
  final int score;
  final String name;
  final Color color;

  const SingleScoreWidget({ this.score, this.color, this.name });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name.toUpperCase(),
          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        Text(
          score.toString(),
          style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 22),
        )
      ],
    );
  }
}