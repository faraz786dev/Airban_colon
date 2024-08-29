import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';
import 'package:game/src/brick_breaker.dart';
import 'package:game/src/config.dart';

class PlayArea extends RectangleComponent with
HasGameReference<BrickBreaker> {
  PlayArea()
  : super(
    paint: Paint()..color = const Color(0xff303646),
    children: [RectangleHitbox()]
  );

  @override
  FutureOr<void> onLoad() async{
    super.onLoad();
    size = Vector2(game.Width, game.height);
  }

}