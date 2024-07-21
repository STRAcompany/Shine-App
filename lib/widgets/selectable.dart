import 'package:flutter/material.dart';
import 'package:shine/data/dummy_lessons.dart';
import 'package:shine/data/selection_data.dart';
import 'package:shine/screens/list_screen.dart';
import 'package:shine/screens/selection.dart';

class Selectable extends StatelessWidget {
  const Selectable(this.index, {required this.selectables, super.key});
  final int index;
  final List<String> selectables;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () {
        if (selectables == classes) {
          dummy.clear();
          dummy.add(classes[index]);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SelectionScreen(
                  selectables: subjects, screenTitle: "Select the subject:"),
            ),
          );
        }
        if (selectables == subjects) {
          if(dummy.length >= 2){
            dummy.removeLast();
          }
          dummy.add(subjects[index]);
          loadData();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>
                  const ListScreen(),
            ),
          );
        }
      },
      splashColor: Theme.of(context).colorScheme.primary,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(
            colors: [
              Theme.of(context).colorScheme.onPrimaryContainer,
              Theme.of(context).colorScheme.secondary,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          selectables[index],
          style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
        ),
      ),
    );
  }
}
