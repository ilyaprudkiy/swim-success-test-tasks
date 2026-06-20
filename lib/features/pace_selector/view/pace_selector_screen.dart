import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/provider/pace_selector_provider.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/widgets/continue_button.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/widgets/pace_level_section.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/widgets/pace_slider_simple.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/widgets/pace_time_picker.dart';
import 'package:swim_success_test_tasks/features/pace_selector/view/widgets/pace_top_bar.dart';

class PaceSelectorScreen extends StatelessWidget {
  const PaceSelectorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<PaceSelectorProvider>();
    return Scaffold(
        body: Material(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  PaceTopBar(),
                  SizedBox(height: 10),
                  Text(
                    'Your fastest 100m free style',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  SizedBox(height: 25),
                  PaceTimePicker(),
                  SizedBox(height: 35),
                  PaceLevelSectionWidget(level: provider.level.title),
                  SizedBox(height: 40),
                  Positioned(
                    child: SizedBox(
                      height: 90,
                      child: PaceSliderSimpleWidget(
                        totalSeconds: provider.totalSeconds,
                        onSliderChanged: (double value) {
                          provider.updateFromSlider(value);
                        },
                      ),
                    ),
                  ),
                  if (provider.errorMessage != null)
                    Text(
                      provider.errorMessage!,
                      style: const TextStyle(color: Colors.redAccent),
                    ),
                  ContinueButtonWidget(
                    onSubmit: () {
                      provider.submitPace();
                    },
                    isLoading: provider.isLoading,
                  ),
                ],
              ),
            ),
          ),
        ),
    );
  }
}
