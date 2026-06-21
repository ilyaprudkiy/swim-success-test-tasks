import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/provider/pace_selector_provider.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/widgets/button_decrement_minutes.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/widgets/button_increment_minutes.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/widgets/pace_time_card.dart';
import 'button_decrement_seconds.dart';
import 'button_increment_seconds.dart';

class PaceTimePicker extends StatelessWidget {
  const PaceTimePicker({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PaceSelectorProvider>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonIncrementMinutesWidget(
              onIncrementMinutes: () {
                provider.increaseMinutes();
              },
            ),
            SizedBox(width: 130),
            ButtonIncrementSecondsWidget(
              onIncrementSeconds: () {
                provider.increaseSeconds();
              },
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PaceTimeCard(
              label: 'Min',
              value: provider.minutes.toString().padLeft(2, '0'),
              onTap: provider.openManualInput,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                ':',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            PaceTimeCard(
              label: 'Sec',
              value: provider.seconds.toString().padLeft(2, '0'),
              onTap: provider.openManualInput,
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonDecrementMinutesWidget(
              onDecrementMinutes: () {
                provider.decreaseMinutes();
              },
            ),
            SizedBox(width: 130),

            ButtonDecrementSecondsWidget(
              onDecrementSeconds: () {
                provider.decreaseSeconds();
              },
            ),
          ],
        ),
      ],
    );
  }
}
