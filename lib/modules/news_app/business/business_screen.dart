
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_abdallah/layout/news_app/cubit.dart';
import 'package:udemy_abdallah/layout/news_app/states.dart';
import 'package:udemy_abdallah/shared/components/components.dart';



class BusinessScreen extends StatelessWidget {
  const BusinessScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){

    var list = NewsCubit.get(context).business;
    
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state) => {},
      builder:(context,state)
      {
        
        return articlebuilder(list,context);
      } 
      );
  }
}