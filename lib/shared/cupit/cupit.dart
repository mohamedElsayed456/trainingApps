import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:udemy_abdallah/shared/cupit/states.dart';
import '../../modules/todo_app/archived tasks/archived_tasks_Screen.dart';
import '../../modules/todo_app/done tasks/done_tasks_screen.dart';
import '../../modules/todo_app/new tasks/new_tasks_screen.dart';

class Appcubit extends Cubit<Appstates>{

  Appcubit():super(Appinitialstate());

  static Appcubit get(context)=>BlocProvider.of(context);

  late Database database;

  List<Map>newtasks = [];
  List<Map>donetasks = [];
  List<Map>archivedtasks = [];

  int currentindex=0;
  List <Widget>screens=[
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchivedTasksScreen(),
  ];
  List<String>titles=[
    'New Tasks',
    'Done Tasks',
    'Archived Tasks',
  ];

  void changeindex(index){
     currentindex=index;
     emit(AppChangeBottomNavBarState());
  }

  void createdatabase(){
    openDatabase(
    'todo.db',
    version: 1,
    onCreate: (database, version) async{
      print('database created');
      await database.execute('CREATE TABLE tasks(id INTEGER PRIMARY KEY,title TEXT,date TEXT,time TEXT,status TEXT)').then((value)
      {
        print('table created');
      }).catchError((error){
        print('error when created table ${error.toString()}');
      });
      },
    onOpen:(database){
      getdatafromdatabase(database);
      print('database opened');
    }
  ).then((value){
    database = value;
    emit(AppCreateDatabaseState());
  });
 }
 
 Future inserttodatabase({
  required String title,
  required String time,
  required String date,
 })async
 {
   await database.transaction((txn)async{
    txn.rawInsert('INSERT INTO tasks(title,date,time,status)VALUES("$title","$date","$time","new")'
    ).then((value){
      print('$value inserted successfully');
      emit(AppinsertDatabaseState());

      getdatafromdatabase(database);
    }
    ).catchError((error){
       print('error when inserted values ${error.toString()}');
      });
     return null;
     });
 }
 
 void getdatafromdatabase(database){

   newtasks=[];
   donetasks=[];
   archivedtasks=[];


 emit(AppgetDatabaseloadingState());

   database.rawQuery('SELECT * FROM tasks').then((value){
    
       value.forEach((element){
       if(element['status']=='new')
        newtasks.add(element);
       
       else if(element['status']=='done')
        donetasks.add(element);
       
       else archivedtasks.add(element);
       });

       emit(AppgetDatabaseState());
      });
 }

void updatedata({
  required String status,
  required int id,
})async
{
  database.rawUpdate(
    'UPDATE Tasks SET status = ? WHERE id = ?',
    ['$status',id],
    
    ).then((value){
      getdatafromdatabase(database);
      emit(AppupdateDatabaseState());

    });
}

void deletedata({
required int id,
})async
{
  database.rawDelete(
    'DELETE FROM Tasks WHERE id = ?', [id]
      ).then((value){
      getdatafromdatabase(database);
      emit(AppdeleteDatabaseState());

    });
}

 bool isbottomsheetshown = false;
  IconData fabicon = Icons.edit;

void changebottomsheetstate({
  required bool isshow,
  required IconData icon,
}){
    isbottomsheetshown=isshow;
    fabicon=icon;

    emit(AppChangeBottomsheetState());
}
}
