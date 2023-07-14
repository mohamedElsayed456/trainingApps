// ignore: import_of_legacy_library_into_null_safe
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
// ignore: import_of_legacy_library_into_null_safe

import 'package:udemy_abdallah/shared/components/components.dart';

import 'package:udemy_abdallah/shared/cupit/cupit.dart';
import 'package:udemy_abdallah/shared/cupit/states.dart';

// ignore: must_be_immutable
class HomeLayout extends StatelessWidget{
  var titlecontroller= TextEditingController();
  var timecontroller = TextEditingController();
  var datecontroller = TextEditingController();

  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => Appcubit()..createdatabase(),
      child: BlocConsumer<Appcubit,Appstates>(
        listener: (context, state){
          if (state is AppinsertDatabaseState) {
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          Appcubit cubit = Appcubit.get(context);
          return Scaffold(
            key:scaffoldkey,
            appBar:AppBar(
              title: Text(Appcubit.get(context)
                  .titles[Appcubit.get(context).currentindex]),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                if (cubit.isbottomsheetshown) {
                  if(formkey.currentState!.validate()){
                  cubit.inserttodatabase(
                      title: titlecontroller.text,
                      time: timecontroller.text,
                      date: datecontroller.text,
                    );
                  
                  }
                 }
                 else{
                  scaffoldkey.currentState!.showBottomSheet(
                        (context) => Container(
                          decoration: BoxDecoration(color: Colors.white),
                          padding: EdgeInsets.all(20.0),
                          child: Form(
                            key: formkey,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children:[
                                defaultformfield(
                                  controller: titlecontroller,
                                  type: TextInputType.text,
                                  label: 'Task Title',
                                  prefix: Icons.title,
                                  validate: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                defaultformfield(
                                  controller: timecontroller,
                                  type: TextInputType.datetime,
                                  label:'Task Time',
                                  prefix: Icons.watch_later_outlined,
                                  validate: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'time must not be Empty';
                                    }
                                    return null;
                                  },
                                  ontap: () {
                                    showTimePicker(
                                      context: context,
                                      initialTime: TimeOfDay.now(),
                                    ).then((value) {
                                      timecontroller.text =
                                          value!.format(context);
                                      print(value.format(context));
                                    });
                                  },
                                ),
                                SizedBox(
                                  height: 15.0,
                                ),

                                defaultformfield(
                                  controller: datecontroller,
                                  type: TextInputType.datetime,
                                  ontap: (){
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime.parse("2050-12-31")
                                    ).then((value) {
                                      datecontroller.text =
                                          DateFormat.yMMMd().format(value!);
                                    });
                                  },
                                  label: 'task date',
                                  prefix: Icons.calendar_today,
                                  validate: (String? value) {
                                    if (value == null || value.isEmpty) {
                                      return 'date must not be Empty';
                                    }
                                    return null;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        elevation: 25.0,
                      
                      ).closed.then((value) {
                    cubit.changebottomsheetstate(
                        isshow: true, icon: Icons.edit);
                  });
                  cubit.changebottomsheetstate(isshow: true, icon: Icons.add);
                }
              },
              child: Icon(cubit.fabicon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              type:BottomNavigationBarType.fixed,
              currentIndex: cubit.currentindex,
              onTap: (index) {
                cubit.changeindex(index);
              },
              items:[
                BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Tasks'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.check_circle_outline), label: 'Done'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.archive_outlined), label: 'Archived'),
              ],
            ),
            body: ConditionalBuilder(
              condition: state is! AppgetDatabaseloadingState,
              builder: (context) => cubit.screens[cubit.currentindex],
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}
