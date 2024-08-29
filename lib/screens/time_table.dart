// import 'package:http/http.dart' as http;

// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:firebase_database/firebase_database.dart';

import 'package:flutter/material.dart';
import 'package:shine/data/days_of_the_week.dart';
import 'package:shine/data/time_table_timedata.dart';
import 'package:shine/data/time_table_todos.dart';
import 'package:shine/screens/auth.dart';
import 'package:shine/widgets/time_table_notset.dart';
import 'package:shine/widgets/time_table_set.dart';

class TimeTableScreen extends StatefulWidget {
  const TimeTableScreen({super.key});
  @override
  State<TimeTableScreen> createState() => _TimeTableScreenState();
}

class _TimeTableScreenState extends State<TimeTableScreen> {
  bool? isSet;
  int rowNumber = 5;
  final columnNumber = 7;
  int fieldsNumber = 35;
  int currentTimeField = 1;
  String time = "Select Time";
  var setTimeValue;
  var setTodoValue;
  var fieldno;
  var rowno;
  final String user = firebase.currentUser!.uid;
  DatabaseReference ref = FirebaseDatabase.instance.ref('users');

  void homePop(context) {
    Navigator.of(context).pop();
  }

  void _saved() {
    ref.child("$user/time_table/timeList").set(timeList);
    ref.child("$user/time_table/todoList").set(todoList);
    ref.child("$user/time_table/fieldno").set(fieldsNumber);
    ref.child("$user/time_table/rowno").set(rowNumber);
    checkSet();
  }

  void _reset() {
    setState(() {
      fieldsNumber = 35;
      rowNumber = 5;
      currentTimeField = 1;
      time = "Select Time";
    });
  }

  void selectTime(int index) async {
    var currenttime = await showTimePicker(
        context: context, initialTime: const TimeOfDay(hour: 5, minute: 00));
    setState(() {
      timeList[index] = currenttime!.format(context);
      currentTimeField = index;
    });
  }

  void selectToDo(int index) async {
    var textEditingController = TextEditingController();
    showMenu(
        color: Theme.of(context).colorScheme.onSurface,
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

  void checkSet() async {
    isSet = null;
    var todo = await ref.child('$user/time_table/todoList').get();
    var time = await ref.child('$user/time_table/timeList').get();
    var fields = await ref.child('$user/time_table/fieldno').get();
    var rows = await ref.child('$user/time_table/rowno').get();
    if (todo.value != null || time.value != null) {
      setState(() {
        isSet = true;
        setTimeValue = time.value;
        setTodoValue = todo.value;
        fieldno = fields.value;
        rowno = rows.value;
      });
    } else {
      setState(() {
        isSet = false;
      });
    }
  }

  void deleteSet() async {
    await ref.child("$user/time_table").remove();
    checkSet();
  }

  @override
  void initState() {
    checkSet();
    super.initState();
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
        child: Builder(
          builder: (context) {
            if (isSet == true) {
              return ListView(
                children: [
                  Text(
                    "Time Table",
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 400,
                    child: TimeTableSet(
                      days: days,
                      fieldsNumber: fieldno,
                      rowNumber: rowno,
                      setTimeValue: setTimeValue,
                      setTodoValue: setTodoValue,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: deleteSet,
                        child: const Text("Delete"),
                      ),
                      const Expanded(child: SizedBox(),),
                    ],
                  ),
                ],
              );
            }
            if (isSet == false) {
              return ListView(
                children: [
                  Text(
                    "Time Table",
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    height: 400,
                    child: TimeTableNotSet(
                      days: days,
                      fieldsNumber: fieldsNumber,
                      rowNumber: rowNumber,
                      selectTime: selectTime,
                      selectToDo: selectToDo,
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
                      ElevatedButton(
                          onPressed: _reset, child: const Text("Reset")),
                      const SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: _saved, child: const Text("Save")),
                    ],
                  ),
                ],
              );
            }
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
