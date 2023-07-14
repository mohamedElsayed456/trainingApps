// ignore_for_file: unused_local_variable, unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_abdallah/layout/news_app/cubit.dart';
import 'package:udemy_abdallah/layout/news_app/states.dart';
import 'package:udemy_abdallah/modules/shop_app/layout/shop_layout.dart';
import 'package:udemy_abdallah/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_abdallah/modules/shop_app/on_boarding/on_boording_screen.dart';
import 'package:udemy_abdallah/shared/bloc_observer.dart';
import 'package:udemy_abdallah/shared/network/local/cashe_helper.dart';
import 'package:udemy_abdallah/shared/network/remote/dio_helper.dart';
import 'package:udemy_abdallah/shared/styles/themes.dart';


void main()async
{
  // بيتاكد ان كل حاجه في الميثود خلصت وبعدين يفتح الابليكيشن  

  WidgetsFlutterBinding.ensureInitialized();

   Bloc.observer = MyBlocObserver();
   DioHelper.init();
   await CasheHelper.init();

   bool isDark=CasheHelper.getData(key: 'isDark');
   Widget widget;
   bool onBoarding=CasheHelper.getData(key: 'onBoarding');
   String? token=CasheHelper.getData(key: 'token'); 

    
    if(onBoarding!=null){
      
      if(token!=null)widget=ShopLayout();
      else widget=ShopLoginScreen();
    }else
    {
      widget=OnBoardingView();
    }

runApp(MyApp(
     isDark:isDark,
     startwidget:widget,
  ));
}
class MyApp extends StatelessWidget{
  
final bool isDark;
final Widget startwidget;
MyApp({
   required this.isDark,
   required this.startwidget,
});

@override
  Widget build(BuildContext context){

    return MultiBlocProvider(
      providers:[
        BlocProvider(create: (context)=>NewsCubit()..getbusiness()..getsports()..getscience()),
        BlocProvider(create:(context) => NewsCubit()..changeappmode(
         fromsahred: isDark
        ),
        ),
        ],
      child: BlocConsumer<NewsCubit,NewsStates>(
        listener: (context, state)=>{},
        builder: (context, state){
          return MaterialApp(
           debugShowCheckedModeBanner:false,
           theme:LightTheme,
           darkTheme: DarkTheme,
           themeMode:NewsCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
           home:startwidget,
         );
        },
       ),
    );
  }
}