// data + UI
import 'package:flutter/material.dart';
import '../models/theme_config_model.dart';
import '../repos/theme_config_repo.dart';

class ThemeConfigViewModel extends ChangeNotifier {
  // access to the data (read&wrie 담당자와 소통해야 함)
  final ThemeConfigRepository _repository;
  late final ThemeConfigModel _model = ThemeConfigModel(
    darkMode: _repository.isDarkMode(),
  );

  ThemeConfigViewModel(this._repository);

  // getter (screen 에서 접근 가능?)
  bool get darkMode => _model.darkMode;

  // view 에 data 공개
  void setDarkMode(bool value) {
    // 1. repository 에서 value 를 disk 에 persist 하게 저장하게 함
    _repository.setDarkMode(value);

    // 2. modify model
    _model.darkMode = value;

    // 3. notify to listeners
    notifyListeners();
  }
}
