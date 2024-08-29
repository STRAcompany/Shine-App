import 'package:flutter/material.dart';
import 'package:shine/widgets/time_table_text.dart';
import 'package:shine/widgets/time_table_time.dart';


class TimeTableSet extends StatelessWidget {
  const TimeTableSet({
    required this.days,
    required this.fieldsNumber,
    required this.rowNumber,
    required this.setTimeValue,
    required this.setTodoValue,
    super.key,
  });
  final int rowNumber;
  final int fieldsNumber;
  final List<String> days;
  final List setTimeValue;
  final List setTodoValue;
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
          return TTTime(setTimeValue[index]);
        }
          return TTText(setTodoValue[index - rowNumber]);
      },
      itemCount: fieldsNumber,
      scrollDirection: Axis.horizontal,
    );
  }
}
