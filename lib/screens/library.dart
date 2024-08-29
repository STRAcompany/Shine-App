import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:shine/data/library_list.dart';
import 'package:shine/screens/pdf_view.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  final searchController = SearchController();
  final storage = FirebaseStorage.instance.ref();
  void homePop(context) {
    Navigator.of(context).pop();
  }

  void showPDF() async {
    final url = await storage.child("pdfs/jesc101 - Copy.pdf").getDownloadURL();
    // ignore: use_build_context_synchronously
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PDFViewScreen(url),
      ),
    );
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
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 20)),
                  leading: Icon(
                    Icons.search,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  hintText: "Search Books",
                  backgroundColor: WidgetStatePropertyAll(
                      Theme.of(context).colorScheme.onSurface),
                  textStyle: WidgetStatePropertyAll(
                    Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  ),
                  controller: searchController,
                ),
              );
            }
            searchController.addListener(
              () {
                setState(() {
                  currentBookList = [searchController.text, ...bookList];
                });
              },
            );
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListTile(
                onTap: showPDF,
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
                tileColor: Theme.of(context).colorScheme.onSurface,
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
