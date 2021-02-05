import 'package:box_me_up/views/game-view/services/ai-interface.dart';
import 'package:box_me_up/views/game-view/services/game.dart';

class SmartAi implements AiInterface {
  final Game game;

  SmartAi(this.game);

  Line selectLine() {
    // TODO: implement selectLine
    throw UnimplementedError();
  }
}