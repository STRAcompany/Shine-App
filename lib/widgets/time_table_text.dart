import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TTText extends StatelessWidget {
  TTText(this.todo,{super.key});
  String todo;
  @override
  Widget build(BuildContext context) {
    if (todo == "Enter"){
      todo = "";
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        todo,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
