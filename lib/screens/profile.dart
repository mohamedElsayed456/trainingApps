import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class ProfileScreen extends StatelessWidget{
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('profile',)),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.only(top:30),
        child: Center(
          child: Column(
            children:[
               Image(
                image:AssetImage('assets/images/image 3.png'),
              ),
              SizedBox(height:20),
              Text('Mahmoud Elashmawy',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              SizedBox(height:70),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all( color: Color(0x4cd9d9d9)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                  children: [
                    Icon(Icons.edit),
                    SizedBox(width: 10,),
                    Text('Edit Profile',style: TextStyle(fontSize: 16,),),
                  ],
                  ),
                ),
              ),
              
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all( color: Color(0x4cd9d9d9)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                  children: [
                    Icon(Icons.history),
                    SizedBox(width: 10,),
                    Text('Orders History',style: TextStyle(fontSize: 16,),),
                  ],
                  ),
                ),
              ),
            
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all( color: Color(0x4cd9d9d9)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                  children: [
                    Image(
                      image:AssetImage('assets/images/Vector1.png'),
                      ),
                    SizedBox(width: 10,),
                    Text('My Cars',style: TextStyle(fontSize: 16,),),
                  ],
                  ),
                ),
              ),
            
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all( color: Color(0x4cd9d9d9)),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Row(
                  children: [
                    Image(
                      image:AssetImage('assets/images/Vector.png'),
                      ),
                    SizedBox(width: 10,),
                    Text('My Requests',style: TextStyle(fontSize: 16,),),
                  ],
                  ),
                ),
              ),            
               
              SizedBox(height: 20,),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed:(){},
                    child:Text('Logout',style: TextStyle(color: Colors.red,fontSize: 16),),
                    ),
                    Icon(Icons.logout,color:Colors.red,)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}