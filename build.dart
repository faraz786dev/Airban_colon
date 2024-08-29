// import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';

// import 'package:flame/collisions.dart';
// import 'package:flame/components.dart';
// import 'package:flame/effects.dart';
// import 'package:flutter/material.dart';
// import 'package:game/src/brick_breaker.dart';
// import 'package:game/src/components/bat.dart';
// import 'package:game/src/components/brick.dart';
// import 'package:game/src/components/play_area.dart';

// class Ball extends CircleComponent with CollisionCallbacks,
//  HasGameReference<BrickBreaker> {
//   Ball({
//     required this.velocity,
//     required super.position,
//     required double radius,
//     required this.difficultyModifier
//   }) : super(
//     radius: radius,
//     anchor: Anchor.center,
//     paint: Paint()
//     ..color = const Color(0xffff9999)
//     ..style = PaintingStyle.fill,
//     children: [CircleHitbox()]);
  

//   final Vector2 velocity;
//   final double difficultyModifier;

//   @override
//   void update(double dt) {
//     super.update(dt);
//     position += velocity * dt;
//   }

//   @override
//   void onCollisionStart(
//     Set<Vector2> intersectionPoints, PositionComponent other) {
//      super.onCollisionStart(intersectionPoints, other);
//      if(other is PlayArea) {
//       if(intersectionPoints.first.y <= 0){
//         velocity.y = -velocity.y;

//       } else if(intersectionPoints.first.x <=0){
//         velocity.x = -velocity.x;
//       } else if(intersectionPoints.first.x >= game.Width){
//         velocity.x = -velocity.x;
//       } else if(intersectionPoints.first.y >= game.height) {
//         add(RemoveEffect(
//           delay: 0.35
//         ));
//       }

//      } else if(other is Bat){
//       velocity.y = -velocity.y;
//       velocity.x = velocity.x +
//       (position.x - other.position.x) / other.size.x * game.Width * 0.3;
//      } else if(other is Brick) {
//       if(position.y < other.position.y - other.size.y/2){
//         velocity.y = -velocity.y;
//       } else if (position.y > other.position.y + other.size.y/2){
//         velocity.y = -velocity.y;
//       } else if(position.x < other.position.x){
//         velocity.x = -velocity.x;
//       } else if(position.x > other.position.x) {
//         velocity.x = -velocity.x;
//       }
//       velocity.setFrom(velocity * difficultyModifier);
//      } else {
//       debugPrint("Collisio happen");
//      }
//     }
  
// }


//gpt

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/material.dart';
import 'package:game/src/brick_breaker.dart';
import 'package:game/src/components/bat.dart';
import 'package:game/src/components/brick.dart';
import 'package:game/src/components/play_area.dart';

class Ball extends CircleComponent with CollisionCallbacks, HasGameReference<BrickBreaker> {
  Ball({
    required this.velocity,
    required super.position,
    required double radius,
    required this.difficultyModifier,
  }) : super(
          radius: radius,
          anchor: Anchor.center,
          paint: Paint()
            ..color = const Color(0xffff9999)
            ..style = PaintingStyle.fill,
          children: [CircleHitbox()],
        );

  final Vector2 velocity;
  final double difficultyModifier;

  @override
  void update(double dt) {
    super.update(dt);
    position += velocity * dt;
  }

  @override
  void onCollisionStart(
      Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if (other is PlayArea) {
      if (intersectionPoints.first.y <= 0) {
        velocity.y = -velocity.y;
      } else if (intersectionPoints.first.x <= 0) {
        velocity.x = -velocity.x;
      } else if (intersectionPoints.first.x >= game.size.x) {
        velocity.x = -velocity.x;
      } else if (intersectionPoints.first.y >= game.size.y) {
        add(RemoveEffect(delay: 0.35));
      }
    } else if (other is Bat) {
      velocity.y = -velocity.y;
      velocity.x += (position.x - other.position.x) / other.size.x * game.size.x * 0.3;
    } else if (other is Brick) {
      if (position.y < other.position.y - other.size.y / 2) {
        velocity.y = -velocity.y;
      } else if (position.y > other.position.y + other.size.y / 2) {
        velocity.y = -velocity.y;
      } else if (position.x < other.position.x) {
        velocity.x = -velocity.x;
      } else if (position.x > other.position.x) {
        velocity.x = -velocity.x;
      }
      velocity.setFrom(velocity * difficultyModifier);
    } else {
      debugPrint("Collision happened");
    }
  }
}
