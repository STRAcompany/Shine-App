import 'dart:math';
import 'package:shine/data/tryout_data.dart';
import 'package:flutter/material.dart';
import 'package:shine/data/greetings.dart';
import 'package:shine/widgets/tryout.dart';

class Shine extends StatelessWidget {
  const Shine({super.key});

  void changeScreen(BuildContext context, Widget screen) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  @override
  Widget build(context) {
    int greetingIndex = Random().nextInt(greetings.length);
    final String greetQuote = greetings[greetingIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shine"),
        actions: [
          TextButton(onPressed: () {}, child: const Text("Home")),
          TextButton(onPressed: () {}, child: const Text("About us")),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Text("Shine",
                style: Theme.of(context).textTheme.titleLarge,
                textAlign: TextAlign.center),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            alignment: Alignment.center,
            child: Text(" Hello name.$greetQuote ",
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center),
          ),
          Container(
            width: 350,
            height: 450,
            margin: const EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 75, 72, 53),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: tryoutData
                    .map(
                      (data) => TryOut(
                        mainData: data,
                        changeScreen: changeScreen,
                      ),
                    )
                    .toList(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
