enum SwimmerLevel {
  beginner,
  intermediate,
  advanced,
  elite;

  static SwimmerLevel fromSeconds(int seconds) {
    // Lower time means a faster swimmer, so the best levels are checked first.
    if (seconds <= 75) return SwimmerLevel.elite;
    if (seconds <= 85) return SwimmerLevel.advanced;
    if (seconds < 110) return SwimmerLevel.intermediate;
    return SwimmerLevel.beginner;
  }

  String get title {
    switch (this) {
      case SwimmerLevel.elite:
        return 'Elite';
      case SwimmerLevel.advanced:
        return 'Advanced';
      case SwimmerLevel.intermediate:
        return 'Intermediate';
      case SwimmerLevel.beginner:
        return 'Beginner';
    }
  }
}
