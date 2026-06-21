import '../../../core/constants/pace_constants.dart';

class PaceTimeHelper {
  static const int minPaceSeconds = PaceConstants.minPaceSeconds;
  static const int maxPaceSeconds = PaceConstants.maxPaceSeconds;
  static const int initialPaceSeconds = PaceConstants.initialPaceSeconds;

  int increaseMinutes(int totalSeconds) {
    return _clamp(totalSeconds + 60);
  }

  int decreaseMinutes(int totalSeconds) {
    return _clamp(totalSeconds - 60);
  }

  int increaseSeconds(int totalSeconds) {
    return _clamp(totalSeconds + 1);
  }

  int decreaseSeconds(int totalSeconds) {
    return _clamp(totalSeconds - 1);
  }

  int fromSlider(double value) {
    return _clamp(value.round());
  }

  int fromManualMinutes({required int minutes, required int currentSeconds}) {
    return minutes * 60 + currentSeconds;
  }

  int fromManualSeconds({required int currentMinutes, required int seconds}) {
    return currentMinutes * 60 + seconds;
  }

  String? validateManualPace({required int minutes, required int seconds}) {
    if (minutes < 0) {
      return 'Minutes cannot be negative';
    }

    if (seconds < 0 || seconds > 59) {
      return 'Seconds must be between 0 and 59';
    }

    // Manual input is rejected instead of clamped so the user sees the mistake.
    final totalSeconds = minutes * 60 + seconds;
    if (totalSeconds < minPaceSeconds || totalSeconds > maxPaceSeconds) {
      final min = PaceConstants.formatSeconds(minPaceSeconds);
      final max = PaceConstants.formatSeconds(maxPaceSeconds);

      return 'Pace must be between $min and $max';
    }

    return null;
  }

  int _clamp(int value) {
    return value.clamp(minPaceSeconds, maxPaceSeconds);
  }
}
