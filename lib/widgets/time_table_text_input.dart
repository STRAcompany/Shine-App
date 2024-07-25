import 'package:flutter/material.dart';

class TTTextInput extends StatelessWidget {
  TTTextInput(this.label, {super.key});
  final String label;
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 20,
      decoration: BoxDecoration(
        border:
            Border.all(width: 2, color: Theme.of(context).colorScheme.primary),
      ),
      child: TextFormField(
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(7),
          label: Text(label),
          fillColor: Theme.of(context).colorScheme.primary,
        ),
        textAlign: TextAlign.start,
        controller: textController,
        onSaved: (newValue) {},
      ),
    );
  }
}
