import 'package:box_me_up/layout/scaffold-widget.dart';
import 'package:box_me_up/views/game-view/components/back-button-widget.dart';
import 'package:box_me_up/views/game-view/components/score-widget.dart';
import 'package:box_me_up/views/game-view/services/game.dart';
import 'package:box_me_up/views/game-view/services/game.enums.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/game-widget.dart';
import 'components/turn-indicator-widget.dart';

class GameViewArguments {
  final int gridSize;
  final AITypes ai;

  GameViewArguments(this.gridSize, this.ai);
}

class GameView extends StatelessWidget {
  static const routeName = '/game';

  @override
  Widget build(BuildContext context) {
    final GameViewArguments args = ModalRoute.of(context).settings.arguments;

    return BoxMeUpLayout(
      body: ChangeNotifierProvider(
        create: (context) => Game(gridSize: args.gridSize, aiType: args.ai),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BackButtonWidget(),
            ScoreWidget(),
            Container(height: 15),
            GameWidget(),
            Container(height: 15),
            TurnIndicatorWidget(),
          ],
        ),
      ),
    );
  }
}