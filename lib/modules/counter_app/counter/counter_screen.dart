import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_abdallah/modules/counter_app/counter/cubit/cubit.dart';
import 'package:udemy_abdallah/modules/counter_app/counter/cubit/states.dart';

class counterScreen extends StatelessWidget{
  


@override
  Widget build(BuildContext context){
    return BlocProvider(
      create:(BuildContext context) =>countercubit(),
       child: BlocConsumer<countercubit,counterstates>(
        listener: (BuildContext context,counterstates state){
          if(state is counterminusstate)
          {
            print('minus state ${state.counter}');
          }
          if(state is counterplusstate)
          {
           print('plus state ${state.counter}');
          }
        },
        builder: (context,counterstates state){
          return Scaffold(
        appBar: AppBar(
          title: Text('counter'),
        ),
        body:Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
            TextButton(
              onPressed:(){
                  countercubit.get(context).minus();
               },
               child:Text('minus'),
               ),
               Padding(
                 padding: const EdgeInsets.symmetric(
                   horizontal: 20.0,
                 ),
                 child: Text(
                   '${countercubit.get(context).counter}',
                   style: TextStyle(fontSize:50.0,fontWeight: FontWeight.w900,
                   ),
                 ),
               ),
               TextButton(
              onPressed: (){
                 countercubit.get(context).plus();
              },
               child:Text('plus'),
               ),
            ],
          ),
         ),
        );
      },
     ),
   );
  }
}