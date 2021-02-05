import 'package:box_me_up/views/game-view/services/ai-interface.dart';
import 'package:box_me_up/views/game-view/services/game.dart';
import 'package:box_me_up/views/game-view/services/game.enums.dart';

class BasicAi implements AiInterface {
  final Game game;

  BasicAi(this.game);

  Line selectLine() {
    // Stupid algorithm, place last line first, otherwise min
    List<Line> lines = List<Line>.from(game.lines).where((line) => line.owner == Player.none).toList();
    lines.shuffle();
    Line bestLine;
    int minScore = 99;
    lines.forEach((Line line) {
      if (line.relatedSquares.where((Square square) => square.score == 3).isNotEmpty) {
        bestLine = line;
        minScore = 4;
      } else if (minScore != 4) {
        List<Square> squares = line.relatedSquares.where((Square square) => square.score < minScore).toList();
        if (squares.isNotEmpty) {
          bestLine = line;
          minScore = squares.first.score;
        }
      }
    });

    return bestLine;
  }
}