import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF050B14),
          colorScheme: const ColorScheme.dark(
            primary: Color(0xFF347DFF),
            surface: Color(0xFF111827),
            onPrimary: Colors.white,
            onSurface: Colors.white,
          ),
        ),
        home: PaceSelectorScreen(),
      ),
    );
  }
}
