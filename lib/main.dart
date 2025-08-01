import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:repro_clip_tap/repro_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GameWidget(game: ReproGame());
  }
}
