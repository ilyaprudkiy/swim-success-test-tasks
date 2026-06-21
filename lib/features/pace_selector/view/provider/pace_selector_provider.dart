import 'package:flutter/material.dart';
import '../../../domain/entities/swimmer_level.dart';
import '../../../domain/helpers/pace_time_helper.dart';
import '../../../domain/repositories/pace_repository.dart';

class PaceSelectorProvider extends ChangeNotifier {
  PaceSelectorProvider(this._paceRepository, this._paceTimeHelper);

  final PaceRepository _paceRepository;
  final PaceTimeHelper _paceTimeHelper;

  int _totalSeconds = PaceTimeHelper.initialPaceSeconds;
  bool _isLoading = false;
  String? _errorMessage;
  String? _manualInputError;
  bool _showDialogWindow = false;

  int get totalSeconds => _totalSeconds;

  int get minutes => _totalSeconds ~/ 60;

  int get seconds => _totalSeconds % 60;

  bool get showDialogWindow => _showDialogWindow;

  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  String? get manualInputError => _manualInputError;

  SwimmerLevel get level => SwimmerLevel.fromSeconds(_totalSeconds);

  void increaseMinutes() {
    _updateTotalSeconds(_paceTimeHelper.increaseMinutes(_totalSeconds));
  }

  void decreaseMinutes() {
    _updateTotalSeconds(_paceTimeHelper.decreaseMinutes(_totalSeconds));
  }

  void increaseSeconds() {
    _updateTotalSeconds(_paceTimeHelper.increaseSeconds(_totalSeconds));
  }

  void decreaseSeconds() {
    _updateTotalSeconds(_paceTimeHelper.decreaseSeconds(_totalSeconds));
  }

  void updateFromSlider(double value) {
    _updateTotalSeconds(_paceTimeHelper.fromSlider(value));
  }

  void updateMinutes(int value) {
    applyManualPace(minutes: value, seconds: seconds);
  }

  void updateSeconds(int value) {
    applyManualPace(minutes: minutes, seconds: value);
  }

  void openManualInput() {
    _showDialogWindow = true;
    _manualInputError = null;
    _errorMessage = null;
    notifyListeners();
  }

  void closeManualInput() {
    _showDialogWindow = false;
    _manualInputError = null;
    notifyListeners();
  }

  bool applyManualPace({required int minutes, required int seconds}) {
    final error = _paceTimeHelper.validateManualPace(
      minutes: minutes,
      seconds: seconds,
    );

    if (error != null) {
      _manualInputError = error;
      _errorMessage = error;
      notifyListeners();
      return false;
    }

    _totalSeconds = _paceTimeHelper.fromManualSeconds(
      currentMinutes: minutes,
      seconds: seconds,
    );
    _showDialogWindow = false;
    _errorMessage = null;
    _manualInputError = null;
    notifyListeners();

    return true;
  }

  Future<void> submitPace() async {
    if (_isLoading) return;

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      await _paceRepository.sendPace(_totalSeconds);
    } catch (_) {
      _errorMessage = 'Failed to send pace. Please try again.';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void _updateTotalSeconds(int value) {
    _totalSeconds = value;
    _errorMessage = null;
    _manualInputError = null;
    notifyListeners();
  }
}
