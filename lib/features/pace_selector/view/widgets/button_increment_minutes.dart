import 'package:flutter/material.dart';

class ButtonIncrementMinutesWidget extends StatelessWidget {
  const ButtonIncrementMinutesWidget({
    super.key,
    required this.onIncrementMinutes,
  });

  final VoidCallback onIncrementMinutes;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 40,
      height: 40,
      decoration: ShapeDecoration(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.white60.withValues(alpha: 0.10),
      ),
      child: Center(
        child: IconButton(
          onPressed: () {
            onIncrementMinutes;
          },
          icon: Icon(Icons.keyboard_arrow_up_outlined),
        ),
      ),
    );
  }
}
