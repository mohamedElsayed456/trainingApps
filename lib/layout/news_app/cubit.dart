import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_abdallah/layout/news_app/states.dart';
import 'package:udemy_abdallah/shared/network/local/cashe_helper.dart';
import 'package:udemy_abdallah/shared/network/remote/dio_helper.dart';
import '../../modules/news_app/business/business_screen.dart';
import '../../modules/news_app/science/Science_Screen.dart';
import '../../modules/news_app/sports/sports_screen.dart';

class NewsCubit extends Cubit<NewsStates>
{
  NewsCubit() :super(NewsInitialStates());

  static NewsCubit get(context)=> BlocProvider.of(context);

  int currentindex=0; 

  List<Widget> Screens =[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
  ];
   
  List<BottomNavigationBarItem> bottomitems = [
    BottomNavigationBarItem(icon:Icon( Icons.business),label: 'Business'),
    BottomNavigationBarItem(icon:Icon( Icons.sports),label: 'Sports'),
    BottomNavigationBarItem(icon:Icon( Icons.science),label: 'Science'),
  ]; 

  void changebottomnavbar(int index){
    currentindex=index;
    
    if(index==1)
    getsports();
    if(index==2)
    getscience();

    emit(NewsBottomnavStates());
  }

  List<dynamic>business=[];
  void getbusiness(){
    emit(NewsgetbusinessloadingStates());
   DioHelper.getdata(
   url: 'v2/top-headlines',              
    query:{            
          'country':'eg',          
          'category':'business',        
          'apiKey':'8946976f9264576fh765476f672575',        
       }
       ).then((value) {
        business=(value.data['articles']);
        print(business[0]['title']);
        emit(NewsbusinesssuccessStates());
         }).catchError((error){
          print(error.toString());
          emit(NewsbusinesserrorStates(error.toString()));
      });
  }

  List<dynamic>sports=[];
  void getsports(){

    emit(NewsgetsportsloadingStates());

   if(sports.length==0)
   {
      DioHelper.getdata(
   url: 'v2/top-headlines',              
    query:{            
          'country':'eg',          
          'category':'sports',        
          'apiKey':'8946976f9264576fh765476f672575',        
       }
       ).then((value) {
        sports=(value.data['articles']);
        print(sports[0]['title']);
        emit(NewssportssuccessStates());
         }).catchError((error){
          print(error.toString());
          emit(NewssportserrorStates(error.toString()));
      });
  }
   else{
    emit(NewssportssuccessStates()); 
   }
}

  List<dynamic>science=[];
  void getscience(){

    emit(NewsgetscienceloadingStates());
  
    if(science.length==0)
    {
        DioHelper.getdata(
   url: 'v2/top-headlines',              
    query:{            
          'country':'eg',          
          'category':'science',        
          'apiKey':'8946976f9264576fh765476f672575',        
       }
       ).then((value) {
        science=(value.data['articles']);
        print(science[0]['title']);
        emit(NewssciencesuccessStates());
         }).catchError((error){
          print(error.toString());
          emit(NewsscienceerrorStates(error.toString()));
      });
    }
    else{
      emit(NewssciencesuccessStates());
    }
   
  }

bool isDark = false;
void changeappmode({bool? fromsahred})
{
  if(fromsahred!=null){
   isDark=fromsahred;
   emit(AppChangeModeState());
  }
   else{
    isDark = !isDark;
    CasheHelper.putBoolean(key:'isDark',value: isDark).then((value)
    {
      emit(AppChangeModeState());
    });
  }
}

List<dynamic>search=[];
  void getsearch(String? value){

    emit(NewsgetsearchloadingStates());
  
   DioHelper.getdata(
   url: 'v2/everything',              
    query:{            
                  
          'q':'$value',        
          'apiKey':'8946976f9264576fh765476f672575',        
       }
       ).then((value) {
       search=(value.data['articles']);
        print(search[0]['title']);
        emit(NewssearchsuccessStates());
         }).catchError((error){
          print(error.toString());
          emit(NewssearcherrorStates(error.toString()));
         
   });
  }

}
