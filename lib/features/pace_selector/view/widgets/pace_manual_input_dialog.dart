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
  static const int _maxInputDigits = 2;

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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return ColoredBox(
      color: colorScheme.scrim.withValues(alpha: 0.55),
      child: Center(
        child: Material(
          color: colorScheme.surface,
          borderRadius: BorderRadius.circular(24),
          child: Container(
            width: 320,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              border: Border.all(color: colorScheme.outline),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter your pace',
                  style: textTheme.titleLarge?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Set minutes and seconds for your fastest 100m freestyle.',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurface.withValues(alpha: 0.70),
                  ),
                ),
                const SizedBox(height: 22),
                Row(
                  children: [
                    Expanded(
                      child: _PaceInputField(
                        controller: _minutesController,
                        label: 'Min',
                        maxDigits: _maxInputDigits,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        ':',
                        style: textTheme.titleLarge?.copyWith(
                          color: colorScheme.onSurface,
                          fontSize: 28,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Expanded(
                      child: _PaceInputField(
                        controller: _secondsController,
                        label: 'Sec',
                        maxDigits: _maxInputDigits,
                      ),
                    ),
                  ],
                ),
                if (errorText != null) ...[
                  const SizedBox(height: 14),
                  Text(errorText, style: TextStyle(color: colorScheme.error)),
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

    // The provider checks the real pace range; the dialog only reads the fields.
    final saved = widget.onSave(minutes: minutes, seconds: seconds);
    if (!saved) {
      setState(() {
        _localError = null;
      });
    }
  }
}

class _PaceInputField extends StatelessWidget {
  const _PaceInputField({
    required this.controller,
    required this.label,
    required this.maxDigits,
  });

  final TextEditingController controller;
  final String label;
  final int maxDigits;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(maxDigits),
      ],
      maxLength: maxDigits,
      textAlign: TextAlign.center,
      style: textTheme.titleLarge?.copyWith(
        color: colorScheme.onSurface,
        fontSize: 30,
        fontWeight: FontWeight.w700,
      ),
      decoration: InputDecoration(counterText: '', labelText: label),
    );
  }
}
