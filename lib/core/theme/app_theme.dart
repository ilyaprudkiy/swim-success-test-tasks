import 'package:flutter/material.dart';

class AppTheme {
  static const Color _background = Color(0xFF050B14);
  static const Color _surface = Color(0xFF111827);
  static const Color _primary = Color(0xFF347DFF);
  static const Color _muted = Color(0xFF9CA3AF);
  static const Color _sliderInactive = Color(0xFF202A3A);

  static ThemeData get dark {
    const colorScheme = ColorScheme.dark(
      primary: _primary,
      surface: _surface,
      onPrimary: Colors.white,
      onSurface: Colors.white,
      error: Colors.redAccent,
      outline: Colors.white12,
    );

    // The app is small, but one theme keeps colors and text sizes in one place.
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _background,
      colorScheme: colorScheme,
      sliderTheme: SliderThemeData(
        trackHeight: 8,
        activeTrackColor: colorScheme.primary,
        inactiveTrackColor: _sliderInactive,
        thumbColor: colorScheme.primary,
        overlayColor: colorScheme.primary.withValues(alpha: 0.15),
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 22),
        activeTickMarkColor: colorScheme.onSurface,
        inactiveTickMarkColor: colorScheme.onSurface,
        tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 2),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: colorScheme.primary.withValues(alpha: 0.45),
          disabledForegroundColor: colorScheme.onPrimary,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: colorScheme.onSurface.withValues(alpha: 0.06),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: _primary, width: 2),
        ),
      ),
      textTheme: const TextTheme(
        titleLarge: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
        titleMedium: TextStyle(fontSize: 16, color: _primary),
        bodyMedium: TextStyle(fontSize: 14),
        bodySmall: TextStyle(fontSize: 13, color: _muted),
        labelLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        labelMedium: TextStyle(fontSize: 14),
        displayMedium: TextStyle(fontSize: 46, fontWeight: FontWeight.w800),
      ),
    );
  }
}
