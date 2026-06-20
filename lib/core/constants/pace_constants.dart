class PaceConstants {
  static const int minPaceSeconds = 50;
  static const int maxPaceSeconds = 240;
  static const int initialPaceSeconds = 90;

  static const List<int> tickValues = [
    70,  // 1:10
    90,  // 1:30
    120, // 2:00
    180, // 3:00
    240, // 4:00
  ];
}