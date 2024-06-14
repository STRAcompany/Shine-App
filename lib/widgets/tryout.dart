import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math';

class TryOut extends StatelessWidget {
  const TryOut({required this.changeScreen, required this.mainData, super.key});
  final void Function(BuildContext context, Widget screen) changeScreen;
  final Map<String, Object> mainData;
  @override
  Widget build(context) {
    int tryOutIndex = Random().nextInt(3);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 15,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          width: 170,
          child: Text(
            (mainData["body contents"] as List<String>)[tryOutIndex].toString(),
            style: GoogleFonts.laila(
              fontSize: 13,
              letterSpacing: 1,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            softWrap: true,
            textAlign: TextAlign.start,
          ),
        ),
        SizedBox(
          width: 130,
          child: ElevatedButton(
            onPressed: () {
              changeScreen(context, mainData["navigation address"] as Widget);
            },
            child: Text(
              mainData["name"].toString(),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
