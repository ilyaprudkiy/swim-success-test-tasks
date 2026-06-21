import 'package:flutter_test/flutter_test.dart';
import 'package:swim_success_test_tasks/features/domain/helpers/pace_time_helper.dart';
import 'package:swim_success_test_tasks/features/domain/repositories/pace_repository.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/provider/pace_selector_provider.dart';

class _FakePaceRepository implements PaceRepository {
  int? sentPace;

  @override
  Future<void> sendPace(int paceSeconds) async {
    sentPace = paceSeconds;
  }
}

void main() {
  test('manual input keeps previous pace when value is too low', () {
    final provider = PaceSelectorProvider(
      _FakePaceRepository(),
      PaceTimeHelper(),
    );

    final saved = provider.applyManualPace(minutes: 0, seconds: 0);

    expect(saved, isFalse);
    expect(provider.totalSeconds, PaceTimeHelper.initialPaceSeconds);
    expect(provider.manualInputError, isNotNull);
  });

  test('manual input keeps previous pace when value is too high', () {
    final provider = PaceSelectorProvider(
      _FakePaceRepository(),
      PaceTimeHelper(),
    );

    final saved = provider.applyManualPace(minutes: 2, seconds: 30);

    expect(saved, isFalse);
    expect(provider.totalSeconds, PaceTimeHelper.initialPaceSeconds);
    expect(provider.manualInputError, isNotNull);
  });

  test('manual input saves valid pace and closes dialog', () {
    final provider = PaceSelectorProvider(
      _FakePaceRepository(),
      PaceTimeHelper(),
    );

    provider.openManualInput();
    final saved = provider.applyManualPace(minutes: 1, seconds: 45);

    expect(saved, isTrue);
    expect(provider.totalSeconds, 105);
    expect(provider.showDialogWindow, isFalse);
    expect(provider.manualInputError, isNull);
  });
}
