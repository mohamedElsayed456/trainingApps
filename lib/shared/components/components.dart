import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:udemy_abdallah/shared/cupit/cupit.dart';

import '../../modules/news_app/web view/webview_Screen.dart';

Widget defaultButton({
   Color background = Colors.blue,
   double width = double.infinity,
   required VoidCallback? function,
   required String text,
    })=>
Container(
  width:width,
 color: background,
 child: MaterialButton(
  onPressed: function,
    child: Text(
           text,
    style: TextStyle(
      fontSize:20.0,
      color: Colors.white,
      
    ),
  ),
),
);

Widget defaulttextbutton({
required VoidCallback? function,
 required String text,
})=>TextButton(
  onPressed:function,
   child: Text(text.toUpperCase()),
   );

Widget defaultformfield( {
  required TextEditingController controller,
  required TextInputType type,
  VoidCallback? ontap,
  bool ispassword = false, 
  required String label, 
  required IconData prefix,
  IconData suffix = Icons.email,
  bool isclickable=true, 
  String? Function(String?)?validate,
  String? Function(String?)?onchange,
  String? Function(String?)?onsubmitt,
  Function()?suffixpressed
  
  
   
  })=>TextFormField(
    controller: controller,
    keyboardType:type,
    enabled:isclickable,
    obscureText:ispassword,
    validator:validate,
    onChanged:onchange,
    onTap:ontap,
    onFieldSubmitted:onsubmitt,
    decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix),
    // ignore: unnecessary_null_comparison
    suffixIcon: suffix!=null?IconButton(
    onPressed:suffixpressed,
    icon: Icon(suffix)):null,

      
    border: OutlineInputBorder(),
        ),
  );

  Widget buildtaskitem(Map model,context) => Dismissible(  
    key: Key(model['id'].toString()),
    child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35.0,
              child: Text('${model['time']}'),
            ),
            SizedBox(width: 10.0,),
            Expanded(
              child:Column(
                mainAxisSize:MainAxisSize.min,
                children:[
                  Text('${model['title']}',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  Text(
                    '${model['date']}',
                    style:TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color: Colors.grey),),
                ],
              ),
            ),
            SizedBox(width: 10.0,),
            IconButton(
              onPressed:(){
                Appcubit.get(context).updatedata(
                  status: 'done',
                  id: model['id'],
                );
              },
              icon:Icon(Icons.check_box),
              color: Colors.green,
            ),
            IconButton(
              onPressed: (){
                 Appcubit.get(context).updatedata(
                  status: 'archive',
                  id: model['id'],
                  );
              },
              icon:Icon(Icons.archive),
              color: Colors.black54,
            ),
          ],
        ),
      ),
     
     onDismissed: (direction) {
       Appcubit.get(context).deletedata(id: model['id']);
     },

    );
                      
  Widget tasksbuilder({
  required List tasks,
  
  })=>ConditionalBuilder(

          condition: tasks.length>0,
          builder: (context) =>  ListView.separated(
              itemBuilder: (context,index)=> buildtaskitem(tasks[index],context),
              separatorBuilder:(context,index)=>mydividor(),
               itemCount:tasks.length,
          ),
          fallback: (context) => Center(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.center,
              children:[
                Icon(Icons.menu,color: Colors.grey,size: 100.0,),
                Text('No tasks yet,please add some tasks',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),
                ),
              ],
            ),
          ),
        );

Widget mydividor()=>Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20.0,
          ),
          child: Container(
            width:double.infinity,
            height: 1.0,
            color:Colors.grey[300],
          ),
              );

 Widget buildarticleitem(article,context)=>InkWell(
  onTap:(){ 
    navigateTo(context,WebViewScreen());
    },
   child: Padding(
 
        padding: const EdgeInsets.all(20),
        child: Row(
          children:[
            Container(
              width:120,
              height:120,
              decoration:BoxDecoration(
                borderRadius:BorderRadius.circular(20) ,
                image: DecorationImage(
                  image: NetworkImage('https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-14-pro-model-unselect-gallery-2-202209_GEO_EMEA?wid=5120&hei=2880&fmt=p-jpg&qlt=80&.v=1660753617539'),
                  fit: BoxFit.cover,
                 ),
              )
            ),
            SizedBox(
              width:15,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children:[
                    Expanded(
                      child: Text(
                        'Title',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines:3,
                        overflow:TextOverflow.ellipsis, 
                      ),
                    ),
                    Text('2021-04-02T11:43:00Z',style: TextStyle(color: Colors.grey),),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
 ); 

void navigateTo (context,widget) => Navigator.push(context, MaterialPageRoute(builder:(context) => widget));

void navigateandfinish (context,widget) => Navigator.pushAndRemoveUntil(context,MaterialPageRoute(
       builder:(context) => widget,
       ),
       (Route<dynamic>route) => false,
     );

 Widget articlebuilder(list,context,{isSearch=false}) => ConditionalBuilder(
       condition:list.length>0,

       builder:(context){
        return ListView.separated(
           physics:BouncingScrollPhysics(),
           itemBuilder: (context,index)=>buildarticleitem(list[index],context),
           separatorBuilder:(context,index)=>mydividor() ,
           itemCount: 10,
           ); 
       },
       fallback: (context) =>isSearch?Container(): Center(child:CircularProgressIndicator()),
      );  
  


 void showToast({
   required String text,
   required Toaststates state,
 })=>Fluttertoast.showToast(
    msg: text,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: chooseToastStates(state),
    textColor:chooseToastStates(state),
    fontSize: 16.0,
  );
//enum
enum Toaststates{success,error,warning}

  Color chooseToastStates(Toaststates state)
  {
     Color color;

     switch(state)
     {
          case Toaststates.success:
          color=Colors.green;
          break;
          case Toaststates.error:
          color=Colors.red;
          break;
          case Toaststates.warning:
          color=Colors.amber;
     }
     return color;
  }
