import 'package:flutter/material.dart';
import 'package:shine/widgets/selectable.dart';

class SelectionScreen extends StatelessWidget {
  const SelectionScreen(
      {required this.selectables, required this.screenTitle, super.key});
  final String screenTitle;
  final List<String> selectables;
  void homePop(context){
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screenTitle),
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
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: selectables.length,
        itemBuilder: (context, index) => Selectable(index,selectables: selectables),
      ),
    );
  }
}
