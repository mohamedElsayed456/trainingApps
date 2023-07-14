import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_abdallah/shared/components/components.dart';
import 'package:udemy_abdallah/shared/cupit/cupit.dart';
import 'package:udemy_abdallah/shared/cupit/states.dart';

class ArchivedTasksScreen extends StatelessWidget{
  const ArchivedTasksScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<Appcubit,Appstates>(
     listener: (context,state){},
       builder:(context,state)
       {
        var tasks=Appcubit.get(context).archivedtasks;
        return tasksbuilder(
          tasks:tasks,
          );
       },
      );
  }
}