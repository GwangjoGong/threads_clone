import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:threads_clone/models/dark_mode_config_model.dart';
import 'package:threads_clone/repos/dark_mode_config_repo.dart';

class DarkModeConfigViewModel extends Notifier<DarkModeConfigModel> {
  final DarkModeConfigRepository _repository;

  DarkModeConfigViewModel({required repository}) : _repository = repository;

  void toggleDarkMode() {
    _repository.toggleDarkMode();
    state = DarkModeConfigModel(
      isDarkMode: !_repository.isDarkMode,
    );
  }

  @override
  DarkModeConfigModel build() {
    return DarkModeConfigModel(
      isDarkMode: _repository.isDarkMode,
    );
  }
}

final darkModeProvider =
    NotifierProvider<DarkModeConfigViewModel, DarkModeConfigModel>(
  () => throw UnimplementedError(),
);
