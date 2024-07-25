import 'package:flutter/material.dart';
import 'package:shine/data/library_list.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});
  void homePop(context) {
    Navigator.of(context).pop();
//     Navigator.popUntil(context, (route) {
//   return route.settings.arguments == const Shine();
// });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Library"),
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
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: bookList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                leading: const Icon(Icons.menu_book),
                title: Text(bookList[index]),
                tileColor: Theme.of(context).colorScheme.secondaryContainer,
                shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                splashColor: Theme.of(context).colorScheme.primaryContainer,
              ),
            );
          },
        ),
      ),
    );
  }
}
