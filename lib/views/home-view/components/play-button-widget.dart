import 'package:box_me_up/views/game-view/game-view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlayButtonWidget extends StatelessWidget {
  final GameViewArguments arguments;

  PlayButtonWidget(this.arguments);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, GameView.routeName, arguments: arguments);
      },
      child: Text('Play'.toUpperCase()),
    );
  }
}