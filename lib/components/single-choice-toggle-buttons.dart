import 'package:flutter/material.dart';

class SingleChoiceToggleButtons extends StatelessWidget {
  final List<String> choices;
  final String choiceSelected;
  final Function onSelect;

  const SingleChoiceToggleButtons({ this.choices, this.choiceSelected, this.onSelect });

  @override
  Widget build(BuildContext context) {
    List <bool> isSelected = [];
    choices.forEach((element) {
      isSelected.add(element == choiceSelected);
    });

    return Container(
      child: LayoutBuilder(builder: (context, constraints) {
        return ToggleButtons(
          constraints: BoxConstraints.expand(width: constraints.maxWidth / 3 - 2, height: 50),
          onPressed: (int index) {
            choices.asMap().forEach((choiceIndex, value) {
              if (choiceIndex == index) {
                isSelected[index] = true;
              } else {
                isSelected[index] = false;
              }
            });
            onSelect(choices[index]);
          },
          children: choices.map((text) => Text(text)).toList(),
          isSelected: isSelected
        );
      }),
    );
  }
}