class PaceConstants {
  // App-wide pace range for the slider, buttons, and manual dialog.
  static const int minPaceSeconds = 70;
  static const int maxPaceSeconds = 120;
  static const int initialPaceSeconds = 90;

  static const List<int> tickValues = [
    70, // 1:10
    90, // 1:30
    120, // 2:00
  ];

  static String formatSeconds(int totalSeconds) {
    // Turns raw seconds into a readable pace like 1:30.
    final minutes = totalSeconds ~/ 60;
    final seconds = totalSeconds % 60;

    return '$minutes:${seconds.toString().padLeft(2, '0')}';
  }
}
