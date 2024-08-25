import 'package:flutter/material.dart';

class TTTimePicker extends StatelessWidget {
  const TTTimePicker(this.selectTime, this.index,
      {required this.time, super.key});
  final void Function(int i) selectTime;
  final String time;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectTime(index);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Theme.of(context).colorScheme.primary,
            width: 2,
          ),
        ),
        alignment: Alignment.center,
        child:SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.access_time,color: Theme.of(context).colorScheme.primary,),
              const SizedBox(width: 10),
              Text(time,overflow: TextOverflow.fade,),
            ],
          ),
        ),
      ),
    );
  }
}
// Container(
//       decoration: BoxDecoration(
//         border: Border.all(width: 2 , color: Theme.of(context).colorScheme.primary),
//       ),
//       alignment: Alignment.center,
//       child: ListTile(
//         leading: IconButton(onPressed: (){selectTime(index);}, icon: Icon(Icons.access_time,color: Theme.of(context).colorScheme.primaryContainer,)),
//         title:Text(time,style: Theme.of(context).textTheme.bodyMedium,),
//       ),
//     );