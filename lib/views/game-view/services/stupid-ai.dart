import 'package:box_me_up/views/game-view/services/ai-interface.dart';
import 'package:box_me_up/views/game-view/services/game.dart';
import 'package:box_me_up/views/game-view/services/game.enums.dart';

class StupidAi implements AiInterface {
  final Game game;

  StupidAi(this.game);

  Line selectLine() {
    List<Line> lines = List<Line>.from(game.lines).where((line) => line.owner == Player.none).toList();
    lines.shuffle();
    return lines[0];
  }
}