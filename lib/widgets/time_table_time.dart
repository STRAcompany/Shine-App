import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TTTime extends StatelessWidget {
  TTTime(this.time, {super.key});
  String time;
  @override
  Widget build(BuildContext context) {
    if (time == "Select Time") {
      time = "Time not set";
    }
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      alignment: Alignment.center,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.access_time_filled,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 10),
          Text(
            time,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
            overflow: TextOverflow.fade,
          ),
        ],
      ),
    );
  }
}
