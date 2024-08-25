// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shine/data/library_list.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final searchController = SearchController();
  void homePop(context) {
    Navigator.of(context).pop();
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
            var currentBookList = bookList; 
            if (index == 0) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: SearchBar(
                  padding: const MaterialStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20)),
                  leading: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  hintText: "Search Books",
                  backgroundColor: MaterialStatePropertyAll(
                      Theme.of(context).colorScheme.onBackground),
                  textStyle: MaterialStatePropertyAll(
                    Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  controller: searchController,
                ),
              );
            }
            searchController.addListener(() {
              setState(() {
                currentBookList = [searchController.text,...bookList];
              });
            },);
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                onTap: () async {
                  // file = await firestore.ref().getData();
                },
                leading: Icon(
                  Icons.menu_book,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                title: Text(
                  currentBookList[index - 1],
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                ),
                tileColor: Theme.of(context).colorScheme.onBackground,
                shape: RoundedRectangleBorder(
                    side: BorderSide(
                        color: Theme.of(context).colorScheme.primary, width: 2),
                    borderRadius: BorderRadius.circular(12)),
                splashColor: Theme.of(context).colorScheme.primaryContainer,
              ),
            );
          },
        ),
      ),
    );
  }
}
