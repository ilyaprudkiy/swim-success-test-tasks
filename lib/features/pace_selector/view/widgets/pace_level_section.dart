import 'package:flutter/material.dart';

class PaceLevelSectionWidget extends StatelessWidget {
  const PaceLevelSectionWidget({super.key, required this.level});

  final String level;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            'Your level',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
          ),
        ),
        Container(
          width: 170,
          height: 35,
          decoration: BoxDecoration(
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(15),
            color: Colors.white60.withValues(alpha: 0.10),
            boxShadow: [
              BoxShadow(color: Colors.white60.withValues(alpha: 0.10)),
            ],
          ),
          child: Center(
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(Icons.pool_outlined, color: Colors.blueAccent),
                  ),
                  Text(level, style: TextStyle(color: Colors.blueAccent)),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
