import 'package:box_me_up/components/single-choice-toggle-buttons.dart';
import 'package:box_me_up/views/game-view/services/game.enums.dart';
import 'package:box_me_up/views/home-view/home-view.dart';
import 'package:flutter/cupertino.dart';

class SettingsWidget extends StatelessWidget {
  final HomeViewState view;

  const SettingsWidget({ this.view });

  @override
  Widget build(BuildContext context) {
    Map<int, String> gridSizeChoices = {
      3: '3x3',
      5: '5x5',
      7: '7x7',
    };
    Map<AITypes, String> playerChoices = {
      AITypes.stupid: "Easy AI",
      // AITypes.smart: "Hard",
      AITypes.none: '2 Players',
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 15),
          child: Text('Grid size :', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        SingleChoiceToggleButtons(
            choices: gridSizeChoices.values.toList(),
            choiceSelected: gridSizeChoices[view.gridSize],
            onSelect: (value) {
              view.setState(() {
                view.gridSize = gridSizeChoices.keys.firstWhere((key) => gridSizeChoices[key] == value);
              });
            }
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(0, 25, 0, 15),
          child: Text('Players :', style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        SingleChoiceToggleButtons(
            choices: playerChoices.values.toList(),
            choiceSelected: playerChoices[view.ai],
            onSelect: (value) {
              view.setState(() {
                view.ai = playerChoices.keys.firstWhere((key) => playerChoices[key] == value);
              });
            }
        ),
      ],
    );
  }
}