import 'package:flutter/material.dart';

class ContinueButtonWidget extends StatelessWidget {
  const ContinueButtonWidget({super.key, required this.onSubmit, required this.isLoading});
  final bool isLoading;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25),
      child: SizedBox(
        width: 250,
        height: 50,
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all<Color>(Colors.blueAccent),
          ),
          onPressed: () {
            onSubmit;
          },
          child: Text(
            'Continue',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
      ),
    );
  }
}
