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
          icon: Icon(Icons.arrow_back, color: Colors.blueAccent),
        ),
        Spacer(),
        Text(
          'Pace Selector',
          style: TextStyle(color: Colors.blueAccent, fontSize: 16),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: IconButton(onPressed: () {}, icon: Icon(Icons.info_outline)),
        ),
      ],
    );
  }
}
