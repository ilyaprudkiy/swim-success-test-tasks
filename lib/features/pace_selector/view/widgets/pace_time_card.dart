import 'package:flutter/material.dart';

class PaceTimeCard extends StatelessWidget {
  const PaceTimeCard({super.key, required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){

    },
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1),
          boxShadow: [BoxShadow(color: Colors.white60.withValues(alpha: 0.10))],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label, style: TextStyle(color: Colors.white)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                value,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 46,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



