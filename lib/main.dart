import 'package:flutter/material.dart';

import 'package:geminichat/on_boarding.dart';
import 'package:geminichat/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightMode,
      darkTheme: darktMode,
      home: const OnboardingPage(),
    );
  }
}
