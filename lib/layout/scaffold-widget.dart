import 'package:flutter/material.dart';

class BoxMeUpLayout extends StatelessWidget {
  final Widget body;
  const BoxMeUpLayout({ @required this.body });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: body
          ),
        ),
      ),
    );
  }
}