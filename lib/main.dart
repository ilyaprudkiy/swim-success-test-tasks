import 'package:flutter/material.dart';
import 'features/pace_selector/view/pace_selector_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: PaceSelectorScreen());
  }
}
