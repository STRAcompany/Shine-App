import 'package:flutter/material.dart';
import 'package:shine/data/time_table_todos.dart';

class TTTextInput extends StatefulWidget {
  const TTTextInput(this.label,this.index,{super.key});
  final String label;
  final int index;

  @override
  State<TTTextInput> createState() => _TTTextInputState();
}

class _TTTextInputState extends State<TTTextInput> {
  final textController = TextEditingController();
  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }
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
        key: ValueKey("${widget.index}"),
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(7),
          label: Text(widget.label),
          fillColor: Theme.of(context).colorScheme.primary,
        ),
        onFieldSubmitted: (value) {
          todoList[widget.index] = value;
        },
        textAlign: TextAlign.start,
        controller: textController,
        validator: (value) {
          if(value == null || value.trim().isEmpty){
            return "please enter a proper value.";
          }
          return null;
        },
        onSaved: (newValue) {
            todoList[widget.index] = newValue!;
        },
      ),
    );
  }
}
