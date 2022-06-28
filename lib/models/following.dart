import 'package:flutter/foundation.dart';

class Following extends ChangeNotifier {
  final List<String> _followingLists = [];
  List<String> get followingLists => _followingLists;

  add(String name) {
    _followingLists.add(name);
    notifyListeners();
  }

  remove(String name) {
    _followingLists.removeWhere((element) => element == name);
    notifyListeners();
  }
}
