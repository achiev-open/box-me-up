import 'dart:developer' as developer;
import 'package:box_me_up/components/single-choice-toggle-buttons.dart';
import 'package:box_me_up/layout/scaffold-widget.dart';
import 'package:box_me_up/views/game-view/game-view.dart';
import 'package:box_me_up/views/game-view/services/game.enums.dart';
import 'package:box_me_up/views/home-view/components/play-button-widget.dart';
import 'package:box_me_up/views/home-view/components/rules-widget.dart';
import 'package:flutter/material.dart';

import '../../main.dart';
import 'components/logo-widget.dart';
import 'components/settings-widget.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/';

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  int gridSize;
  AITypes ai;

  HomeViewState() {
    gridSize = 3;
    ai = AITypes.basic;
  }

  @override
  Widget build(BuildContext context) {
    return BoxMeUpLayout(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                LogoWidget(),
                RulesWidget(),
              ],
            ),
            SettingsWidget(view: this),
            PlayButtonWidget(GameViewArguments(gridSize, ai)),
          ]
      ),
    );
  }
}