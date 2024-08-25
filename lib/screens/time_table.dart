// import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shine/data/days_of_the_week.dart';
import 'package:shine/data/time_table_timedata.dart';
import 'package:shine/data/time_table_todos.dart';
import 'package:shine/widgets/time_table_text_picker.dart';
import 'package:shine/widgets/time_table_timepicker.dart';

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({super.key});
  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  int rowNumber = 5;
  final columnNumber = 7;
  int fieldsNumber = 35;
  int currentTimeField = 1;
  String time = "Select Time";

  void homePop(context) {
    Navigator.of(context).pop();
  }

  void _saved() {}

  void _reset() {
    setState(() {
      fieldsNumber = 35;
      rowNumber = 5;
      currentTimeField = 1;
      time = "Select Time";
    });
  }

  void selectTime(index) async {
    var currenttime = await showTimePicker(
        context: context, initialTime: const TimeOfDay(hour: 5, minute: 00));
    setState(() {
      timeList[index] = currenttime!.format(context);
      currentTimeField = index;
    });
  }

  void selectToDo(index) async {
    var textEditingController = TextEditingController();
    showMenu(
        color: Theme.of(context).colorScheme.onBackground,
        context: context,
        position: RelativeRect.fromDirectional(
            textDirection: TextDirection.ltr,
            start: 150,
            top: 300,
            end: 400,
            bottom: 400),
        items: [
          PopupMenuItem(
            height: 12,
            child: Text(
              "Enter Todo",
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
              textAlign: TextAlign.start,
            ),
          ),
          PopupMenuItem(
            child: Container(
              width: 100,
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  fillColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                ),
              ),
            ),
          ),
          PopupMenuItem(
              child: ElevatedButton(
            child: const Text("save"),
            onPressed: () {
              setState(() {
                todoList[index - rowNumber] = textEditingController.text;
                Navigator.of(context).pop();
              });
            },
          ))
        ]);
  }

  void _addRow() async {
    setState(() {
      rowNumber = rowNumber + 1;
      fieldsNumber = fieldsNumber + columnNumber;
      timeList.add("Select Time");
      todoList.addAll([
        "Enter",
        "Enter",
        "Enter",
        "Enter",
        "Enter",
        "Enter",
      ]);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          'The Row has been succesfully added.',
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(color: Theme.of(context).colorScheme.primary),
        ),
        duration: const Duration(seconds: 3), // Optional: Set the duration
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              rowNumber = rowNumber - 1;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Table"),
        actions: [
          TextButton(
              onPressed: () {
                homePop(context);
              },
              child: Text(
                "Home",
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
              )),
          TextButton(
            onPressed: () {},
            child: Text(
              "About us",
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Text(
              "Time Table",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 400,
              child: GridView.builder(
                shrinkWrap: true,
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
                        ));
                  }
                  if (index < rowNumber) {
                    return TTTimePicker(selectTime, index,
                        time: timeList[index]);
                  }
                  return TTTextPicker(selectToDo, index, todoList[index - rowNumber]);
                },
                itemCount: fieldsNumber,
                scrollDirection: Axis.horizontal,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: _addRow,
                  label: const Text("Add Rows"),
                  icon: const Icon(Icons.add),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(onPressed: _reset, child: const Text("Reset")),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: _saved, child: const Text("Save")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
