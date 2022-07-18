import 'package:flutter/material.dart';

class Player {
  static const none = '';
  static const X = 'X';
  static const Y = 'Y';

  static Color setCellColor(BuildContext context, String player) {
    switch (player) {
      case Player.X:
        return Theme.of(context).colorScheme.onTertiaryContainer;
      case Player.Y:
        return Theme.of(context).colorScheme.onErrorContainer;
      default:
        return Theme.of(context).colorScheme.onPrimaryContainer;
    }
  }

  static Color setBackgroundColor(BuildContext context, String player) {
    String newPlayer = player == Player.X ? Player.Y : Player.X;
    return setCellColor(context, newPlayer).withAlpha(150);
  }
}
