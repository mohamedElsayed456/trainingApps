import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_abdallah/layout/news_app/cubit.dart';
import 'package:udemy_abdallah/layout/news_app/states.dart';
import 'package:udemy_abdallah/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen ({super.key});

  @override
  Widget build(BuildContext context){
   var searchcontroller=TextEditingController(); 

    return BlocConsumer<NewsCubit,NewsStates>(
      
      listener:( context,  state){},
      builder: ( context, state){

        var list=NewsCubit.get(context).search;

        return Scaffold(
        appBar: AppBar(),
        body:Column(
          children:[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: defaultformfield(
                controller:searchcontroller,
                type:TextInputType.text,
                label:'search',
                prefix:Icons.search,
                validate: (String? value){
                 if (value == null || value.isEmpty){
                  return 'search must not be Empty';
                }
                  return null;
                },
                onchange: ( value){
                  NewsCubit.get(context).getsearch(value);
                  return null;
                },
                ),
              ),
               Expanded(child: articlebuilder(list, context,isSearch: true))
            ],
        ),
      );
      }
    );
  }
}