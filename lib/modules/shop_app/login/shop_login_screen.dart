import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemy_abdallah/modules/shop_app/layout/shop_layout.dart';
import 'package:udemy_abdallah/modules/shop_app/login/cubit/cubit.dart';
import 'package:udemy_abdallah/modules/shop_app/login/cubit/states.dart';
import 'package:udemy_abdallah/modules/shop_app/register/register_screen.dart';
import 'package:udemy_abdallah/shared/components/components.dart';
import 'package:udemy_abdallah/shared/network/local/cashe_helper.dart';

// ignore: must_be_immutable
class ShopLoginScreen extends StatelessWidget {

var formkey=GlobalKey<FormState>(); 

  @override
  Widget build(BuildContext context){

   var emailcontroller=TextEditingController();
   var passwordcontroller=TextEditingController();

    return BlocProvider(
      create: (context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit,ShopLoginStates>(
        listener:(context, state){
          if (state is ShopLoginSuccessState){
            if(state.loginModel.status!){
              print(state.loginModel.message);
              print(state.loginModel.data!.token);
                 
              CasheHelper.saveData(key:'token', value:state.loginModel.data!.token).then((value){
                navigateandfinish(context,ShopLayout());
              });                         
            }
            else
            {
               print(state.loginModel.message);

              showToast(
                text: state.loginModel.message!,
                state:Toaststates.error, 
                );
            }
          }
        },
        builder:(context, state){
          return Scaffold(
           
            appBar:AppBar(),
              
              body:Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Form(
                      key:formkey,      
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('LOGIN',style:TextStyle(fontSize:34,fontWeight:FontWeight.bold)),
                          SizedBox(height: 15,),
                          Text('login now to browse our hot offers',style:TextStyle(fontSize: 18,color: Colors.grey)),
                          SizedBox(height: 50,),
                          defaultformfield(
                             controller: emailcontroller, 
                             validate: (String? value) {
                                if (value == null || value.isEmpty){
                                   return 'emailaddress must not be Empty';
                                  }
                                  return null;
                                },
                             type:TextInputType.emailAddress,
                             label: 'Email Address', 
                             prefix:Icons.email_outlined,
                             ),
                                      
                             SizedBox(height: 15,),
                                      
                            defaultformfield(
                             ispassword: ShopLoginCubit.get(context).ispassword,
                             
                             controller: passwordcontroller, 
                             validate: (String? value) {
                                if (value == null || value.isEmpty){
                                   return 'password is too short';
                                  }
                                  return null;
                                },
                             type:TextInputType.visiblePassword,
                             suffix: ShopLoginCubit.get(context).suffix,
                             suffixpressed:(){
                                ShopLoginCubit.get(context).changepasswordvisibility();
                             },
                             onsubmitt:(value){
                               if(formkey.currentState!.validate()){
                                    ShopLoginCubit.get(context).userLogin(
                                    email:emailcontroller.text,
                                    password:passwordcontroller.text,
                                    );
                                   }
                               return null;
                                   },
                             label: 'Password', 
                             prefix:Icons.lock_outline,
                             ),
                                      
                             SizedBox(height:30,),
                                      
                             ConditionalBuilder(
                              condition: state is! ShopLoginLoadingState,
                              builder:(context) => defaultButton(
                                function:(){
                                  if(formkey.currentState!.validate()){
                                    ShopLoginCubit.get(context).userLogin(
                                    email:emailcontroller.text,
                                    password:passwordcontroller.text,
                                    );
                                   }
                                  },
                                text:'LOGIN',
                                ),
                               fallback: (context) => Center(child: CircularProgressIndicator()),
                             ),
                                      
                              SizedBox(height: 5,),
                                      
                              Row(
                                mainAxisAlignment:MainAxisAlignment.center,
                                children:[
                                  Text(
                                    'Don.t have an account?',
                                  ),
                                  defaulttextbutton(
                                    function:(){
                                      navigateTo(context, RegisterScreen());
                                      },
                                       text:('register'),
                                       ),
                                ],
                              )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          );
        },
      ),
    );
  }
}