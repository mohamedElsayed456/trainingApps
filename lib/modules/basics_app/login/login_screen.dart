

import 'package:flutter/material.dart';
import 'package:udemy_abdallah/shared/components/components.dart';

// ignore: must_be_immutable
class loginscreen extends StatelessWidget {

  var emailcontroller=TextEditingController();
  var passwordcontroller=TextEditingController();
  var formkey=GlobalKey<FormState>();
 
  
   @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(), 
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Container(
          
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key:formkey,
                child: Column(
                 children:[
                    Text(
                      'login',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                      SizedBox(
                        height:40.0,
                      ),
                      defaultformfield(
                        controller:emailcontroller,
                        type:TextInputType.emailAddress,
                        label:'email',
                        prefix:Icons.email,
                        
                       ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultformfield(
                        controller:passwordcontroller,
                        type:TextInputType.visiblePassword,
                        label:'password',
                        prefix:Icons.lock,
                        
                          ispassword:true,
                          suffix: Icons.remove_red_eye, 
                         ),
                      SizedBox(
                        height:20.0,
                      ),
                      TextFormField(
                        keyboardType:TextInputType.phone,
                         validator: (value) {
                          if(value==null){
                            return ;
                          }
                           if(value.isEmpty){
                            print('phone must not be empty');
                           }
                           return null;
                          },
                        decoration:InputDecoration(
                          labelText: 'phone',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.phone_android)
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      defaultButton(
                        background: Colors.blue,
                        width:100,
                        text: 'login',
                        function: ()
                        {
                          
                       
                            print(emailcontroller.text);
                            print(passwordcontroller.text);
                        
                       }
                        
                           ),
                      SizedBox(
                        height:10.0,
                      ),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                        children:[
                          Text('don.t have an account?'),
                          TextButton(
                            onPressed: (){},
                             child: Text('register now')
                             ),
                        ],
                      )
                    ],
                  ),
              ),
            ),
          ),
        ),
      ),
      
    );
  }
}