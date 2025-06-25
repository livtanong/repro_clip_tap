import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

class ReproGame extends FlameGame {
  @override
  FutureOr<void> onLoad() {
    add(
      // If you tap just outside this rectangle, where the rest of
      // [ClickableArea] would be seen had it not been clipped by
      // [ClipComponent], [ClickableArea] still receives tap events.
      ClipComponent.rectangle(
        size: Vector2.all(128),
        children: [ClickableArea()],
      ),
    );
  }
}

class ClickableArea extends RectangleComponent with TapCallbacks {
  ClickableArea()
    : super(size: Vector2.all(256), paint: Paint()..color = Colors.red);

  @override
  void onTapUp(TapUpEvent event) {
    print("Tapped $event");
  }
}
