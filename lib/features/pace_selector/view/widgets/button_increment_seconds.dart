import 'package:flutter/material.dart';

class ButtonIncrementSecondsWidget extends StatelessWidget {
  const ButtonIncrementSecondsWidget({
    super.key,
    required this.onIncrementSeconds,
  });

  final VoidCallback onIncrementSeconds;

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
            onIncrementSeconds;
          },
          icon: Icon(Icons.keyboard_arrow_up_outlined),
        ),
      ),
    );
  }
}
