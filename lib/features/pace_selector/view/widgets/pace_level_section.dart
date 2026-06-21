import 'package:flutter/material.dart';

class PaceLevelSectionWidget extends StatelessWidget {
  const PaceLevelSectionWidget({super.key, required this.level});

  final String level;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Your level',
            style: textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w300),
          ),
        ),
        AnimatedContainer(
          // The level can change while the user drags the slider, so keep it soft.
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
          width: 170,
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(15),
            color: colorScheme.onSurface.withValues(alpha: 0.10),
            boxShadow: [
              BoxShadow(color: colorScheme.onSurface.withValues(alpha: 0.10)),
            ],
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 220),
                switchInCurve: Curves.easeOut,
                switchOutCurve: Curves.easeIn,
                transitionBuilder: (child, animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: ScaleTransition(scale: animation, child: child),
                  );
                },
                child: Row(
                  key: ValueKey(level),
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Icon(
                        Icons.pool_outlined,
                        color: colorScheme.primary,
                      ),
                    ),
                    Text(
                      level,
                      style: textTheme.labelMedium?.copyWith(
                        color: colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
