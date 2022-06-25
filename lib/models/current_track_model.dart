import 'package:flutter/material.dart';
import 'package:flutter_project/data/data.dart';

class CurrentTrackModel extends ChangeNotifier {
  Song? selectedTrack;

  void selectTrack(Song track) {
    selectedTrack = track;
    notifyListeners();
  }
}