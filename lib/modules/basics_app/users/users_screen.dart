import 'package:flutter/material.dart';
import 'package:udemy_abdallah/models/user/usermodel_screen.dart';


// ignore: must_be_immutable
class USersScreen extends StatelessWidget {
 List <Usermodel> Users = [
   Usermodel(
     id:1,
     name:'Ahmed Asem',
     phone:'01016666974',
       ),
   Usermodel(
       id: 2, 
       name: 'Ahmed Elsayed',
        phone: '01283736333',
        ),  
   Usermodel(
     id:3,
     name:'Ahmed Alaa',
     phone:'010234568739',
       ),
   Usermodel(
       id: 4, 
       name: 'Mostafa Yasser',
        phone: '01286373029',
        ),  
   Usermodel(
     id:5,
     name:'Samir Mazhar',
     phone:'01172396474',
       ),
   Usermodel(
       id: 6, 
       name: 'Taqawi',
        phone: '01286289364',
        ),  
   Usermodel(
     id: 7,
      name: 'Adel Rashwan',
       phone: '01526789933',
       ),
 ];

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body:ListView.separated(
        itemBuilder: (context,index)=>builduseritem(Users[index]),
         separatorBuilder: (context,index)=>Padding(
           padding: const EdgeInsetsDirectional.only(
             start: 20.0,
           ),
           child: Container(
             color: Colors.grey[300],
             width: double.infinity,
             height: 1.0,
            ),
         ),
          itemCount: Users.length,
          ),
     );
  }
  Widget builduseritem(Usermodel user)=>
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children:[
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: TextStyle(
                  fontSize:25.0, 
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),
          SizedBox(
            width: 20.0,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Text('${user.name}',
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.bold,
              ),
              ),
              Text('${user.phone}',
              style: TextStyle(
                color: Colors.grey,
              ),
              ),
            ],
          )       
          ],
        ),
      );
}