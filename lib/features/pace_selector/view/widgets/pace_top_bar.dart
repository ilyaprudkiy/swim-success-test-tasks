import 'package:flutter/material.dart';

class PaceTopBar extends StatelessWidget {
  const PaceTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: colorScheme.primary),
        ),
        const Spacer(),
        Text(
          'Pace Selector',
          style: textTheme.titleMedium?.copyWith(color: colorScheme.primary),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.info_outline, color: colorScheme.onSurface),
        ),
      ],
    );
  }
}
