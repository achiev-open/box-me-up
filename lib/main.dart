import 'dart:ui';

import 'package:box_me_up/views/game-view/game-view.dart';
import 'package:box_me_up/views/home-view/home-view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BoxMeUp());
}

class AchievTheme {
  static int white = 0xFFF9F9F9;
  static int black = 0xFF282828;
  static int blue = 0xFF0B5884;
  static int green = 0xFF064929;
  static int yellow = 0xFFEACC0B;
  static int orange = 0xFFD3664A;
  static int red = 0xFFAC202B;
}

class BoxMeUp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Box me up',
      routes: {
        HomeView.routeName: (context) => HomeView(),
        GameView.routeName: (context) => GameView(),
      },
      theme: Theme.of(context).copyWith(
        scaffoldBackgroundColor: Color(AchievTheme.white),

        colorScheme: ColorScheme.light(
          background: Color(AchievTheme.white),
          onBackground: Color(AchievTheme.black),
          error: Color(AchievTheme.red),
          onError: Color(AchievTheme.white),
          primary: Color(AchievTheme.blue),
          onPrimary: Color(AchievTheme.white),
        ),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Color(AchievTheme.black), fontSize: 16)
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15),
            textStyle: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 5,
            )
          )
        ),
        // textButtonTheme: TextB,
        toggleButtonsTheme: ToggleButtonsThemeData(
          fillColor: Color(AchievTheme.blue),
          selectedColor: Color(AchievTheme.white),
          selectedBorderColor: Color(AchievTheme.blue),
          borderRadius: BorderRadius.circular(5),
          borderColor: Color(AchievTheme.blue),
          color: Color(AchievTheme.blue)
        ),
        dialogTheme: DialogTheme(
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color(AchievTheme.blue)
          ),
          contentTextStyle: TextStyle(
            color: Color(AchievTheme.black),
          ),
        ),
      ),
    );
  }
}
