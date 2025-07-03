import 'dart:async';

import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class ReproGame extends FlameGame {
  @override
  FutureOr<void> onLoad() {
    add(Window());
  }
}

class Window extends PositionComponent with GestureHitboxes {
  @override
  Future<void> onLoad() async {
    super.onLoad();
    final hitbox = RectangleHitbox(size: Vector2.all(64));
    hitbox.renderShape = true;
    hitbox.paint = Paint()..color = Colors.purple;

    // If you tap just outside this rectangle, where the rest of
    // [ClickableArea] would be seen had it not been clipped by
    // [ClipComponent], [ClickableArea] still receives tap events.
    final clipComponent = ClipComponent.rectangle(
      size: Vector2.all(128),
      children: List.generate(5, (index) {
        return Button(position: Vector2(0, index * (72 + 16)));
      }),
    );
    add(clipComponent);

    // Notice how even if a hitbox is added, it doesn't stop
    // [Button] from being triggered.
    add(hitbox);
  }

  @override
  bool get debugMode => true;
}

class Button extends RectangleComponent with TapCallbacks {
  Button({super.position}) : super(size: Vector2.all(72));

  bool _toggled = false;

  bool get toggled => _toggled;

  set toggled(bool value) {
    _toggled = value;
    paint.color = toggled ? Colors.blue : Colors.red;
  }

  @override
  FutureOr<void> onLoad() {
    paint.color = Colors.red;
    return super.onLoad();
  }

  @override
  void onTapUp(TapUpEvent event) {
    toggled = !toggled;
  }

  @override
  bool get debugMode => true;
}
