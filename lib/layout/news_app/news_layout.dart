
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_abdallah/layout/news_app/cubit.dart';
import 'package:udemy_abdallah/layout/news_app/states.dart';
import 'package:udemy_abdallah/shared/components/components.dart';


import '../../modules/news_app/search/search_screen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({ Key? key }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context, state)=> {},
      builder: (context, state){
        
        var cubit=NewsCubit.get(context); 
        
        return Scaffold(
        appBar:AppBar(
          title: Text('News App'),
          actions:[
            IconButton(icon: Icon(Icons.search,),
            onPressed:(){
              navigateTo(context, SearchScreen());
            }
            ),
            IconButton(
              icon: Icon(
                Icons.brightness_4_outlined
                ),
                onPressed:(){
                 cubit.changeappmode();
                }
                ),
          ],
          ),
        bottomNavigationBar:BottomNavigationBar(
             items:cubit.bottomitems,
             currentIndex:cubit.currentindex,
             onTap:(index){
             cubit.changebottomnavbar(index);
         },
        ),
        
        body:cubit.Screens[cubit.currentindex],
         );
      }
    );
  }
}                                                       