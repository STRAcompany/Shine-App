import 'package:flutter/material.dart';
import 'package:shine/data/dummy_lessons.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});
  void homePop(context) {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lessons"),
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
      body: ListView.builder(
        itemCount: dummyLessons.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(7.0),
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              onTap: () {},
              splashColor: const Color.fromARGB(255, 255, 184, 5),
              child: Card(
                elevation: 5,
                color: Theme.of(context).colorScheme.onPrimaryContainer,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text("$index.  ${dummyLessons[index].lsName}"),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
