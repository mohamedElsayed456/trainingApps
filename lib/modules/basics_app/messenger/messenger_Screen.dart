import 'package:flutter/material.dart';

class Messenger_Screen  extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar:AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children:[
            CircleAvatar(
              radius: 20.0,
              backgroundImage:NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg')
            ),
            SizedBox(
              width: 10,
            ),
            Text('chats',style: TextStyle(fontSize: 30.0,color: Colors.black),)
          ],
        ),
        actions:[
          IconButton(
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.camera_alt,
                size: 18.0,
                       ),
            ),
           onPressed: (){},
          ),
         
          IconButton(
            icon: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.edit,
                size: 18.0,
                       ),
            ),
           onPressed: (){},
          ),
        ],
           
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:[
              Container(
                padding:EdgeInsets.all(5),
                decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(10),
                color: Colors.grey[300]
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    SizedBox(
                      width:10.0,
                    ),
                    Text('search',style: TextStyle(fontSize: 20.0),),
                  ],
                ),
              ),
            SizedBox(
              height:20.0
            ), 
              Container(
                height:100,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder:(context,index)=>buildstoryitem(),
                  separatorBuilder: (context, index) => SizedBox(width: 20.0 ,),
                  itemCount: 7,
                  ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ListView.separated(
              physics:NeverScrollableScrollPhysics(),
              shrinkWrap:true,
             itemBuilder: (context,index)=>buildchatitem(),
             separatorBuilder:  (context,index)=>SizedBox(height: 20.0,),
              itemCount:10,
              ),
            ],
          ),
        ),
      ),
    );
    
  }
  Widget buildchatitem()=>
      Row(
            children:[
               Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      children:[ 
                        CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:NetworkImage('https://ar.wikipedia.org/wiki/%D9%85%D9%84%D9%81:Leucanthemum_vulgare_%27Filigran%27_Flower_2200px.jpg')
                                ),
                         Padding(
                           padding: const EdgeInsetsDirectional.only(
                             bottom: 0.3,
                             end: 0.3,
                             
                           ),
                           child: CircleAvatar(
                             radius: 7,
                             backgroundColor: Colors.green,
                           ),
                         ) ,
                               
                      ],
                    ),
           SizedBox(
             width: 20.0,
           ),
           Expanded(
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 Text(
                   'mohamed Elsayed',
                 style: TextStyle(
                   fontSize: 16.0,
                   fontWeight: FontWeight.bold,
                 ),
                 ),
                 SizedBox(
                   height: 5,
                 ),
                 Row(
                  children:[
                      Text('hello',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
           
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Container(
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            color: Colors.black45,
                            shape: BoxShape.circle
                          )
                        ),
                      ),
                      Text('02.30 pm'),
                 ],
                ),
               ],
             ),
           ) 
            ],
          );

   Widget buildstoryitem()=>                 
      Container(
              width: 60.0,
              child: Column(
           children: [
              Stack(
                alignment: AlignmentDirectional.bottomEnd,
                children:[ 
                  CircleAvatar(
                            radius: 30.0,
                            backgroundImage:NetworkImage('https://cdn.pixabay.com/photo/2015/04/19/08/33/flower-729512__340.jpg')
                          ),
                   Padding(
                     padding: const EdgeInsetsDirectional.only(
                       bottom: 0.3,
                       end: 0.3,
                       
                     ),
                     child: CircleAvatar(
                       radius: 7,
                       backgroundColor: Colors.green,
                     ),
                   ) ,
                         
                ],
              ),
              SizedBox(
                height: 7.0,
              ),
              Text(
                'mohamed elsayed ahmed ahmed',
                maxLines: 2,
                overflow: TextOverflow.ellipsis ,
              )
           ],
          
              ),
            );
 
}