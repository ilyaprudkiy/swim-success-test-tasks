import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swim_success_test_tasks/core/theme/app_theme.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/provider/pace_selector_provider.dart';
import 'core/di/service_locator.dart';
import 'features/pace_selector/view/pace_selector_screen.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => sl<PaceSelectorProvider>(),
      child: MaterialApp(theme: AppTheme.dark, home: PaceSelectorScreen()),
    );
  }
}
