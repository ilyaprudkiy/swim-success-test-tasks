import 'package:flutter/material.dart';

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
    return Column(
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            trackHeight: 8,

            activeTrackColor: const Color(0xFF347DFF),
            inactiveTrackColor: const Color(0xFF202A3A),

            thumbColor: const Color(0xFF347DFF),
            overlayColor: const Color(0xFF347DFF).withValues(alpha: 0.15),

            thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 12),

            overlayShape: const RoundSliderOverlayShape(overlayRadius: 22),

            activeTickMarkColor: Colors.white,
            inactiveTickMarkColor: Colors.white,

            tickMarkShape: const RoundSliderTickMarkShape(tickMarkRadius: 2),
          ),
          child: Slider(
            min: 70,
            max: 120,
            divisions: 2,
            value: totalSeconds.toDouble(),
            onChanged: (value) {
              onSliderChanged;
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              _PaceLabel(time: '1:10', level: 'Elite'),
              _PaceLabel(time: '1:30', level: 'Intermediate'),
              _PaceLabel(time: '2:00', level: 'Beginner'),
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

  const _PaceLabel({required this.time, required this.level});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(time, style: const TextStyle(color: Colors.white, fontSize: 14)),
        const SizedBox(height: 4),
        Text(level, style: TextStyle(color: Colors.grey, fontSize: 13)),
      ],
    );
  }
}
