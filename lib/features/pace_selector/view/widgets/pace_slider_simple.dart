import 'package:flutter/material.dart';
import '../../../../core/constants/pace_constants.dart';

class PaceSliderSimpleWidget extends StatelessWidget {
  final int totalSeconds;
  final ValueChanged<double> onSliderChanged;

  const PaceSliderSimpleWidget({
    super.key,

    required this.onSliderChanged,
    required this.totalSeconds,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Slider(
          min: PaceConstants.minPaceSeconds.toDouble(),
          max: PaceConstants.maxPaceSeconds.toDouble(),
          divisions:
              PaceConstants.maxPaceSeconds - PaceConstants.minPaceSeconds,
          value: totalSeconds.toDouble(),
          onChanged: (value) {
            onSliderChanged(value);
          },
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _PaceLabel(
                time: '1:10',
                level: 'Elite',
                timeStyle: textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
                levelStyle: textTheme.bodySmall,
              ),
              _PaceLabel(
                time: '1:30',
                level: 'Intermediate',
                timeStyle: textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
                levelStyle: textTheme.bodySmall,
              ),
              _PaceLabel(
                time: '2:00',
                level: 'Beginner',
                timeStyle: textTheme.labelMedium?.copyWith(
                  color: colorScheme.onSurface,
                ),
                levelStyle: textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PaceLabel extends StatelessWidget {
  final String time;
  final String level;
  final TextStyle? timeStyle;
  final TextStyle? levelStyle;

  const _PaceLabel({
    required this.time,
    required this.level,
    required this.timeStyle,
    required this.levelStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(time, style: timeStyle),
        const SizedBox(height: 4),
        Text(level, style: levelStyle),
      ],
    );
  }
}
