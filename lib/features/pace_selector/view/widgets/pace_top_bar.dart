import 'package:flutter/material.dart';

class PaceTopBar extends StatelessWidget {
  const PaceTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.arrow_back, color: Colors.blueAccent),
        ),
        const Spacer(),
        const Text(
          'Pace Selector',
          style: TextStyle(color: Colors.blueAccent, fontSize: 16),
        ),
        const Spacer(),
        IconButton(onPressed: () {}, icon: const Icon(Icons.info_outline)),
      ],
    );
  }
}
