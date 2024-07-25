import 'package:flutter/material.dart';

class TTTimePicker extends StatelessWidget{
  const TTTimePicker(this.selectTime,this.index,{required this.time, super.key});
  final void Function(int i) selectTime;
   final String time;
   final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 2 , color: Theme.of(context).colorScheme.primary),
      ),
      alignment: Alignment.center,
      child: ListTile(
        leading: IconButton(onPressed: (){selectTime(index);}, icon: Icon(Icons.access_time,color: Theme.of(context).colorScheme.primaryContainer,)),
        title:Text(time,style: Theme.of(context).textTheme.bodyMedium,),
      ),
    );
  }
}