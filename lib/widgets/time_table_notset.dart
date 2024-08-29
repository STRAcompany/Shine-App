import 'package:flutter/material.dart';
import 'package:shine/data/time_table_timedata.dart';
import 'package:shine/data/time_table_todos.dart';
import 'package:shine/widgets/time_table_text_picker.dart';
import 'package:shine/widgets/time_table_time_picker.dart';

class TimeTableNotSet extends StatelessWidget{
  const TimeTableNotSet({
    required this.days,
    required this.fieldsNumber,
    required this.rowNumber,
    required this.selectTime,
    required this.selectToDo,
    super.key,
  });
  final int rowNumber;
  final int fieldsNumber;
  final List<String> days;
  final void Function(int index) selectTime;
  final void Function(int index) selectToDo;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: rowNumber,
        childAspectRatio: 1 / 3,
        // mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        if (index % rowNumber == 0) {
          double day = index / rowNumber;
          return Container(
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            alignment: Alignment.center,
            child: Text(
              days[day.round()],
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          );
        }
        if (index < rowNumber) {
          return TTTimePicker(selectTime, index, time: timeList[index]);
        }
        return TTTextPicker(selectToDo, index, todoList[index - rowNumber]);
      },
      itemCount: fieldsNumber,
      scrollDirection: Axis.horizontal,
    );
  }
}