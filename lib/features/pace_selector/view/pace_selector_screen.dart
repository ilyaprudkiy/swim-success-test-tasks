import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/provider/pace_selector_provider.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/widgets/continue_button.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/widgets/pace_level_section.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/widgets/pace_manual_input_dialog.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/widgets/pace_slider_simple.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/widgets/pace_time_picker.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/widgets/pace_top_bar.dart';

class PaceSelectorScreen extends StatelessWidget {
  const PaceSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // watch() rebuilds this screen when the selected pace or dialog state changes.
    final provider = context.watch<PaceSelectorProvider>();
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Material(
        child: Stack(
          children: [
            SafeArea(
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    children: [
                      PaceTopBar(),
                      SizedBox(height: 10),
                      Text(
                        'Your fastest 100m freestyle',
                        style: textTheme.titleMedium?.copyWith(
                          color: textTheme.bodySmall?.color,
                        ),
                      ),
                      SizedBox(height: 25),
                      PaceTimePicker(),
                      SizedBox(height: 35),
                      PaceLevelSectionWidget(level: provider.level.title),
                      SizedBox(height: 40),
                      SizedBox(
                        height: 90,
                        child: PaceSliderSimpleWidget(
                          totalSeconds: provider.totalSeconds,
                          onSliderChanged: (double value) {
                            provider.updateFromSlider(value);
                          },
                        ),
                      ),
                      if (provider.errorMessage != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            provider.errorMessage!,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: colorScheme.error),
                          ),
                        ),
                      ContinueButtonWidget(
                        onSubmit: provider.submitPace,
                        isLoading: provider.isLoading,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // The provider owns this flag, so opening and closing stays in one place.
            if (provider.showDialogWindow)
              PaceManualInputDialog(
                initialMinutes: provider.minutes,
                initialSeconds: provider.seconds,
                errorText: provider.manualInputError,
                onCancel: provider.closeManualInput,
                onSave: provider.applyManualPace,
              ),
          ],
        ),
      ),
    );
  }
}
