import 'package:flutter/material.dart';

class ButtonDecrementSecondsWidget extends StatelessWidget {
  const ButtonDecrementSecondsWidget({
    super.key,
    required this.onDecrementSeconds,
  });

  final VoidCallback onDecrementSeconds;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Ink(
      width: 40,
      height: 40,
      decoration: ShapeDecoration(
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
        color: colorScheme.onSurface.withValues(alpha: 0.10),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 7),
        child: Center(
          child: IconButton(
            onPressed: () {
              onDecrementSeconds();
            },
            icon: Icon(
              Icons.keyboard_arrow_down_outlined,
              color: colorScheme.onSurface,
            ),
          ),
        ),
      ),
    );
  }
}
