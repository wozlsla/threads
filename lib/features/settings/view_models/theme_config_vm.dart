// data + UI
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/theme_config_model.dart';
import '../repos/theme_config_repo.dart';

class ThemeConfigViewModel extends Notifier<ThemeConfigModel> {
  // access to the data (read&wrie 담당자와 소통해야 함)
  final ThemeConfigRepository _repository;

  ThemeConfigViewModel(this._repository);

  void setDarkMode(bool value) {
    _repository.setDarkMode(value); // disk에 저장

    state = ThemeConfigModel(
      darkMode: value,
    );
  }

  @override
  ThemeConfigModel build() {
    return ThemeConfigModel(
      darkMode: _repository.isDarkMode(),
    );
  }
}

final themeConfigProvider =
    NotifierProvider<ThemeConfigViewModel, ThemeConfigModel>(
  () => throw UnimplementedError(),
);
