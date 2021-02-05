import 'package:box_me_up/main.dart';
import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {
            showAlertDialog(context).then((exit) {
              if (exit) Navigator.pop(context);
            });
          },
          child: Icon(Icons.arrow_back),
        ),
      ],
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the buttons
    Widget cancelButton = TextButton(
      child: Text("Cancel"),
      onPressed:  () {
        Navigator.of(context).pop(false);
      },
    );
    Widget continueButton = TextButton(
      child: Text("Confirm", style: TextStyle(color: Color(AchievTheme.red), fontWeight: FontWeight.bold)),
      onPressed:  () {
        Navigator.of(context).pop(true);
      },
    );

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Do you want to leave the game ?"),
          content: Text("This game will be lost. Click on Confirm if you want to go back to the main menu."),
          actions: [
            cancelButton,
            continueButton,
          ],
        );
      },
    );
  }
}