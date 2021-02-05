import 'package:flutter/cupertino.dart';

class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Image.asset(
        'assets/logo.png',
        height: constraints.maxWidth / 1.5,
        width:  constraints.maxWidth / 1.5,
      );
    });
  }
}