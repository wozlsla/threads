import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/settings_model.dart';
import '../repos/settings_repo.dart';

class SettingsViewModel extends Notifier<SettingsModel> {
  final SettingsRepository _repository; // access to the data

  SettingsViewModel(this._repository);

  void setDarkMode(bool newValue) {
    _repository.setDarkMode(newValue); // disk(저장소)에 value 저장
    state = SettingsModel(darkMode: newValue); // 상태 변경
  }

  /* build() : 데이터의 초기 상태(state) 반환 !! 
    Notifier가 생성될 때 딱 한 번 실행됨. -> 앱 실행 시: settingsProvider가 처음 생성될 때
      Notifier가 노출할 데이터를 제공하는 방법. 
      Notifier 내부라면 어디든지 state(data)에 접근,수정 가능 */
  @override
  SettingsModel build() {
    return SettingsModel(
      darkMode: _repository.getDarkMode(), // 호출 -> 저장된 다크모드 값을 가져와서 초기 상태로 설정.
    );
  }
}

/* NotifierProvider
  <
    type: expose 하고 싶은 provider
    type: provider가 expose 할 데이터(model)
  >
*/
final settingsProvider = NotifierProvider<SettingsViewModel, SettingsModel>(
  () => throw UnimplementedError(),
);
