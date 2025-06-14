import 'package:flutter/material.dart';
import 'package:riverpod/riverpod.dart';

class ThemeNotifier extends StateNotifier<ThemeMode> {
  ThemeNotifier() : super(ThemeMode.light);

  void toggleTheme() {
    if (state == ThemeMode.light) {
      state = ThemeMode.dark;
    } else {
      state = ThemeMode.light;
    }
  }
}

final themeProvider=StateNotifierProvider<ThemeNotifier,ThemeMode>((ref)=> 
   ThemeNotifier()
);
