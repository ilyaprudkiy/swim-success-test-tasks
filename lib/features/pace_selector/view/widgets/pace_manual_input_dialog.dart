import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PaceManualInputDialog extends StatefulWidget {
  const PaceManualInputDialog({
    super.key,
    required this.initialMinutes,
    required this.initialSeconds,
    required this.errorText,
    required this.onCancel,
    required this.onSave,
  });

  final int initialMinutes;
  final int initialSeconds;
  final String? errorText;
  final VoidCallback onCancel;
  final bool Function({required int minutes, required int seconds}) onSave;

  @override
  State<PaceManualInputDialog> createState() => _PaceManualInputDialogState();
}

class _PaceManualInputDialogState extends State<PaceManualInputDialog> {
  late final TextEditingController _minutesController;
  late final TextEditingController _secondsController;
  String? _localError;

  @override
  void initState() {
    super.initState();
    _minutesController = TextEditingController(
      text: widget.initialMinutes.toString(),
    );
    _secondsController = TextEditingController(
      text: widget.initialSeconds.toString().padLeft(2, '0'),
    );
  }

  @override
  void dispose() {
    _minutesController.dispose();
    _secondsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final errorText = _localError ?? widget.errorText;

    return ColoredBox(
      color: Colors.black.withValues(alpha: 0.55),
      child: Center(
        child: Material(
          color: const Color(0xFF111827),
          borderRadius: BorderRadius.circular(24),
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: Colors.white12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Enter your pace',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Set minutes and seconds for your fastest 100m freestyle.',
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    Expanded(
                      child: _PaceInputField(
                        controller: _minutesController,
                        label: 'Min',
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        ':',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Expanded(
                      child: _PaceInputField(
                        controller: _secondsController,
                        label: 'Sec',
                      ),
                    ),
                  ],
                ),
                if (errorText != null) ...[
                  const SizedBox(height: 14),
                  Text(
                    errorText,
                    style: const TextStyle(color: Colors.redAccent),
                  ),
                ],
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: widget.onCancel,
                        child: const Text('Cancel'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: FilledButton(
                        onPressed: _save,
                        child: const Text('Save'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _save() {
    final minutes = int.tryParse(_minutesController.text.trim());
    final seconds = int.tryParse(_secondsController.text.trim());

    if (minutes == null || seconds == null) {
      setState(() {
        _localError = 'Enter minutes and seconds';
      });
      return;
    }

    // Domain limits are checked by the provider so the dialog stays UI-only.
    final saved = widget.onSave(minutes: minutes, seconds: seconds);
    if (!saved) {
      setState(() {
        _localError = null;
      });
    }
  }
}

class _PaceInputField extends StatelessWidget {
  const _PaceInputField({required this.controller, required this.label});

  final TextEditingController controller;
  final String label;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.06),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFF347DFF), width: 2),
        ),
      ),
    );
  }
}
