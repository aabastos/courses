import 'package:flutter/material.dart';

class ErrorDialog extends StatefulWidget {
  final String title;
  final String description;

  const ErrorDialog({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  State<ErrorDialog> createState() => _ErrorDialogState();
}

class _ErrorDialogState extends State<ErrorDialog> {
  void handleConfirmPress() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Text(widget.description),
      actions: [
        TextButton(
          onPressed: handleConfirmPress,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
