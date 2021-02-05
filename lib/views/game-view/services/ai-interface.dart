import 'package:box_me_up/views/game-view/services/game.dart';

abstract class AiInterface {
  final Game game;

  AiInterface(this.game);

  Line selectLine();
}