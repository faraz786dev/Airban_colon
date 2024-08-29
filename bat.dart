// import 'package:flame/collisions.dart';
// import 'package:flame/components.dart';
// import 'package:flame/effects.dart';
// import 'package:flame/events.dart';
// import 'package:flutter/material.dart';
// import 'package:game/src/brick_breaker.dart';

// class Bat extends PositionComponent with DragCallbacks, HasGameReference<BrickBreaker> {
//   Bat({
//    required this.cornerRadius,
//    required super.position,
//    required super.size,

//   }) : super(
//     anchor: Anchor.center,
//     children: [RectangleHitbox()]
//   );

//   final Radius cornerRadius;

//   final _paint = Paint()
//   ..color = const Color(0xffffffff)
//   ..style = PaintingStyle.fill;

//   @override
//   void render(Canvas canvas)
//   {
//     super.render(canvas);
//     canvas.drawDRRect(
//       RRect.fromRectAndCorners(Offset.zero & size.toSize(), cornerRadius),
//       _paint
//     );
//   }
//   @override 
//   void onDragUpdate(DragUpdateEvent event) {
//     super.onDragUpdate(event);
//     position.x = (position.x + event.localDelta.x).clamp(0, game.Width);
//   }

//   void moveBy(double dx) {
//     add(MoveToEffect(
//       Vector2((position.x + dx).clamp(0, game.Width),position.y),
//       EffectController(duration: 0.1)
//     ) 
//     );
//   }

// }



//gpt

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flame/events.dart';
import 'package:flutter/material.dart';
import 'package:game/src/brick_breaker.dart';

class Bat extends PositionComponent with DragCallbacks, HasGameReference<BrickBreaker> {
  Bat({
    required this.cornerRadius,
    required super.position,
    required super.size,
  }) : super(
          anchor: Anchor.center,
          children: [RectangleHitbox()],
        );

  final Radius cornerRadius;

  final _paint = Paint()
    ..color = const Color(0xffffffff)
    ..style = PaintingStyle.fill;

  @override
  void render(Canvas canvas) {
    super.render(canvas);
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Offset.zero & size.toSize(),
        topLeft: cornerRadius,
        topRight: cornerRadius,
        bottomLeft: cornerRadius,
        bottomRight: cornerRadius,
      ),
      _paint,
    );
  }

  @override
  void onDragUpdate(DragUpdateEvent event) {
    super.onDragUpdate(event);
    position.x = (position.x + event.localDelta.x).clamp(0.0, game.size.x - size.x);
  }

  void moveBy(double dx) {
    add(MoveToEffect(
      Vector2((position.x + dx).clamp(0.0, game.size.x - size.x), position.y),
      EffectController(duration: 0.1),
    ));
  }
  
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    // Now it’s safe to use gameRef here.
  }
}
