import 'package:flutter/material.dart';

class ButtonDecrementMinutesWidget extends StatelessWidget {
  const ButtonDecrementMinutesWidget({
    super.key,
    required this.onDecrementMinutes,
  });

  final VoidCallback onDecrementMinutes;

  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 40,
      height: 40,
      decoration: ShapeDecoration(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        color: Colors.white60.withValues(alpha: 0.10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 7),
        child: Center(
          child: IconButton(
            onPressed: () {
              onDecrementMinutes();
            },
            icon: Icon(Icons.keyboard_arrow_down_outlined),
          ),
        ),
      ),
    );
  }
}
