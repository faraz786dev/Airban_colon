import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:game/src/brick_breaker.dart';

void main() {
  final game = BrickBreaker();
  runApp(GameWidget(game: game));
}
