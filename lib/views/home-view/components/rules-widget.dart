import 'package:flutter/cupertino.dart';

class RulesWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Rules :', style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
        Container(height: 5),
        Text('- Tap between two dots to draw a line'),
        Text('- Draw the last line around a box to win it'),
        Text('- When you win a box, you play again'),
        Text('- Win more boxes that your opponent'),
        Text('- Have fun !')
      ],
    );
  }
}