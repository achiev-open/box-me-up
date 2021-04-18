import 'package:box_me_up/main.dart';
import 'package:box_me_up/views/game-view/game-view.dart';
import 'package:box_me_up/views/game-view/components/game-widget.dart';
import 'package:box_me_up/views/game-view/services/ai-interface.dart';
import 'package:box_me_up/views/game-view/services/basic-ai.dart';
import 'package:box_me_up/views/game-view/services/game.enums.dart';
import 'package:box_me_up/views/game-view/services/smart-ai.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'dart:io';

class Square {
  final int x;
  final int y;
  int score;
  Player owner;

  Square(this.x, this.y) {
    score = 0;
    owner = Player.none;
  }
}

class Line {
  final int id;
  final int x;
  final int y;
  final LineDirection direction;
  final List<Square> relatedSquares;
  Player owner;

  Line(this.id, this.x, this.y, this.direction, this.relatedSquares) {
    owner = Player.none;
  }
}

class Game extends ChangeNotifier {
  // Game settings
  final int gridSize;
  final AITypes aiType;

  AiInterface aiPlayer;
  // Game status
  Player currentPlayer;
  int firstPlayerScore;
  int secondPlayerScore;
  List<Square> grid;
  List<Line> lines;
  int lastLineId = -1;
  Player winner;

  Game({ this.gridSize, this.aiType }) {
    firstPlayerScore = 0;
    secondPlayerScore = 0;

    this.initGrid();
    this.initLinesFromGrid();

    currentPlayer = Player.first;
    winner = Player.none;

    switch (aiType) {
      case AITypes.stupid:
        aiPlayer = new BasicAi(this);
        break;
      case AITypes.smart:
        aiPlayer = new SmartAi(this);
        break;
      default: break;
    }
  }

  initGrid() {
    grid = [];
    for (int y = 0; y < gridSize; y++) {
      for (int x = 0; x < gridSize; x++) {
        grid.add(new Square(x, y));
      }
    }
  }

  initLinesFromGrid() {
    int lineId = 0;
    lines = [];
    for (int i = 0; i < grid.length; i++) {
      Square square = grid[i];

      // Top line
      List<Square> topSides = [square];
      if (square.y > 0) {
        topSides.add(grid[(square.y - 1) * gridSize + square.x]);
      }
      lines.add(new Line(lineId, square.x, square.y, LineDirection.horizontal, topSides));
      lineId++;

      // Left line
      List<Square> leftSide = [square];
      if (square.x > 0) {
        leftSide.add(grid[square.y * gridSize + square.x - 1]);
      }
      lines.add(new Line(lineId, square.x, square.y, LineDirection.vertical, leftSide));
      lineId++;

      // Right line
      if (square.x == gridSize - 1) {
        lines.add(new Line(lineId, square.x + 1, square.y, LineDirection.vertical, [square]));
        lineId++;
      }
      // Bottom line
      if (square.y == gridSize - 1) {
        lines.add(new Line(lineId, square.x, square.y + 1, LineDirection.horizontal, [square]));
        lineId++;
      }
    }
  }

  selectLine(Line line) {
    lastLineId = line.id;
    bool hasWonSquare = false;
    line.owner = currentPlayer;
    line.relatedSquares.forEach((Square square) {
      square.score += 1;
      if (square.score == 4) {
        square.owner = currentPlayer;
        hasWonSquare = true;
        if (currentPlayer == Player.first) {
          firstPlayerScore += 1;
        } else {
          secondPlayerScore += 1;
        }
      }
    });
    if (!hasWonSquare) {
      currentPlayer = currentPlayer == Player.first ? Player.second : Player.first;
    } else {
      if (firstPlayerScore + secondPlayerScore == gridSize * gridSize) {
        winner = firstPlayerScore > secondPlayerScore ? Player.first : Player.second;
      }
    }
    notifyListeners();
  }
  makeAiAction() {
    Line selectedLine = aiPlayer.selectLine();
    selectLine(selectedLine);
    notifyListeners();
  }
}