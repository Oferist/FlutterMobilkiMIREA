// Это Cubit для управления состоянием темы

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ThemeCubit extends Cubit<ThemeMode> {
  // По умолчанию светлая тема
  ThemeCubit() : super(ThemeMode.light);

  /// Переключить тему
  void toggleTheme(bool isDark) {
    emit(isDark ? ThemeMode.dark : ThemeMode.light);
  }
}