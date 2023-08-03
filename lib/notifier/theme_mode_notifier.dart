import 'package:flutter_riverpod/flutter_riverpod.dart';

enum ThemeModeState { light, dark }

final themeNotifierProvider =
    StateNotifierProvider<ThemeNotifier, ThemeModeState>(
        (ref) => ThemeNotifier());

class ThemeNotifier extends StateNotifier<ThemeModeState> {
  ThemeNotifier() : super(ThemeModeState.light);

  void toggleTheme() {
    state = state == ThemeModeState.light
        ? ThemeModeState.dark
        : ThemeModeState.light;
  }
}
