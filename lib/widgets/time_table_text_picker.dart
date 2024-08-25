import 'package:flutter/material.dart';

class TTTextPicker extends StatelessWidget {
  const TTTextPicker(this.selectToDo, this.index, this.toDo,{super.key});
  final void Function(int i) selectToDo;
  final String toDo;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectToDo(index);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child:Text(toDo),
      ),
    );
  }
}
