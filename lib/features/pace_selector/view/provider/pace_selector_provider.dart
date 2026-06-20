import 'package:flutter/material.dart';
import '../../../../core/constants/pace_constants.dart';
import '../../../data/pace_api_service.dart';
import '../../../domain/entities/swimmer_level.dart';


class PaceSelectorProvider extends ChangeNotifier {
  PaceSelectorProvider(this._apiService);

  final PaceApiService _apiService;

  bool _showDialogWindow = false;

  int _totalSeconds = 90;
  bool _isLoading = false;
  String? _errorMessage;

  bool get showDialogWindow => _showDialogWindow;

  int get totalSeconds => _totalSeconds;

  int get minutes => _totalSeconds ~/ 60;

  int get seconds => _totalSeconds % 60;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  SwimmerLevel get level => SwimmerLevel.fromSeconds(_totalSeconds);

  void incrementMinutes() {
    _setTotalSeconds(_totalSeconds + 60);
  }

  void decrementMinutes() {
    _setTotalSeconds(_totalSeconds - 60);
  }

  void incrementSeconds() {
    _setTotalSeconds(_totalSeconds + 1);
  }

  void decrementSeconds() {
    _setTotalSeconds(_totalSeconds - 1);
  }

  void updateFromSlider(double value) {
    _setTotalSeconds(value.round());
  }

  void updateMinutes(int value) {
    final newTotal = value * 60 + seconds;
    _setTotalSeconds(newTotal);
  }

  void updateSeconds(int value) {
    if (value < 0 || value > 59) {
      _errorMessage = 'Seconds must be between 0 and 59';
      notifyListeners();
      return;
    }

    final newTotal = minutes * 60 + value;
    _setTotalSeconds(newTotal);
  }

  Future<void> submitPace() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _apiService.sendPace(totalSeconds);
    } catch (_) {
      _errorMessage = 'Something went wrong. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void onStateShowWindow() {
    _showDialogWindow = true;
    notifyListeners();
  }

  void _setTotalSeconds(int value) {
    _totalSeconds = value.clamp(
      PaceConstants.minPaceSeconds,
      PaceConstants.maxPaceSeconds,
    );

    _errorMessage = null;
    notifyListeners();
  }
}
