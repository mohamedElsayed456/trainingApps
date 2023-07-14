import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_abdallah/models/shop_app/login_model.dart';
import 'package:udemy_abdallah/modules/shop_app/login/cubit/states.dart';
import 'package:udemy_abdallah/shared/network/endpoints.dart';
import 'package:udemy_abdallah/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates>
{
 ShopLoginCubit():super(ShopLoginInitialState());

  static ShopLoginCubit get(context)=>BlocProvider.of(context);

  ShopLoginModel? loginModel;
  
  void userLogin({
    required String email,
    required String password,
  })
  {
    emit(ShopLoginLoadingState());
    DioHelper.postdata(
      url: LOGIN,
      data:{
        'email':email,
        'password':password,
      }
      ).then((value){

        loginModel=ShopLoginModel.fromJson(value.data);
        print(loginModel!.status);
        print(loginModel!.message);
        print(loginModel!.data!.name);
        emit(ShopLoginSuccessState(loginModel!));

      }).catchError((error){
        emit(ShopLoginErrorState(error.toString()));
      });
  }



  IconData suffix=Icons.visibility_outlined;
  bool ispassword=true;

  void changepasswordvisibility(){
     ispassword=!ispassword;
     suffix=ispassword?Icons.visibility_outlined:Icons.visibility_off_outlined;

     emit(ShopchangepasswordvisibilityState());
  }

}