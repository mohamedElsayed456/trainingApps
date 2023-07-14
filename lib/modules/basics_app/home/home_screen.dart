import 'package:flutter/material.dart';
class homescreen  extends StatelessWidget {
 

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('first app'),
        leading: Icon(
          Icons.menu,
          ),
          actions:[
            IconButton(
               icon:Icon(Icons.notification_important),
               onPressed:() {
                 print ('onnotification');
               },
               ),
               IconButton(
                 icon:Icon(Icons.search),
                 onPressed: () {
                   print('search');
                 },
               ),
               IconButton(
                 onPressed:()
                 {
                     print('connected tv');
                 },
                icon:Icon(Icons.connected_tv)
                ),
          ],
          
      ),
       body: Column(
         children: [
           Padding(
             padding: const EdgeInsets.all(50),
             child: Container(
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20.0)
                 
               ),
               clipBehavior: Clip.antiAliasWithSaveLayer,
               child: Stack(
                 alignment: Alignment.bottomCenter,
                 children:[ 
                   Image(
                   image:NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg'),
                    
                   fit: BoxFit.cover,
                 ),
                 Container(
                   width: double.infinity,
                   color: Colors.black.withOpacity(.7),
                   padding: EdgeInsets.symmetric(
                     
                     vertical :5.0,
                   ),
                   child: Text(
                     'flower',
                     textAlign: TextAlign.center,
                     style: TextStyle(color: Colors.white,fontSize: 30.0),
                   ),
                 ),
                 ],
               ),
             ),
           ) 
         ],
       ) 
        );
  }
}