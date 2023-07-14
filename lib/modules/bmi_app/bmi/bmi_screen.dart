import 'dart:math';

import 'package:flutter/material.dart';

import '../bmi result/bmi_result_screen.dart';



class Bmi_calculator extends StatefulWidget {
  const Bmi_calculator({ Key? key }) : super(key: key);

  @override
  _Bmi_calculatorState createState() => _Bmi_calculatorState();
}

class _Bmi_calculatorState extends State<Bmi_calculator>{

  bool ismale=true;
  double height=120.0;
  int weight=60;
  int age=20;

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi calculator'),
      ),
      body: Column(
      children:[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
               Expanded(
                 child: GestureDetector(
                  onTap: (){
                    setState(() {
                      ismale=true;
                    });
                  },
                   child: Container(
                    decoration: BoxDecoration(
                      color:ismale?Colors.blue: Colors.grey[300],
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                     child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Image(
                          image:AssetImage('assets/images/male.png'),
                          height: 100,
                          width: 100,
                          ),
                        SizedBox(
                          height:10,
                          ),
                        Text('Male',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                      ],
                     ),
                     
                   ),
                 ),
               ),
               SizedBox(
                width: 20.0,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        ismale=false;
                      });
                    },
                    child: Container(
                     decoration: BoxDecoration(
                       color:ismale? Colors.grey[300]:Colors.blue,
                       borderRadius: BorderRadius.circular(10.0)
                     ),
                      child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                        Image(
                          image:AssetImage('assets/images/female.png'), 
                          height: 100,
                          width: 100,
                          ),
                         SizedBox(
                           height:10,
                           ),
                         Text('Female',style:TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
                       ],
                      ),
                      
                    ),
                  ),
                )
              ],
           ),
          ),
            ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10.0)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Text('Hight',style: TextStyle(fontSize: 20),),
                 
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic, 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:[
                      Text('${height.round()}',style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold),),
                      Text('CM',),
                    ],
                  ),
                  Slider(
                    value:height,
                    max: 220.0,
                    min: 50, 
                   onChanged: (value){
                  setState(() {
                    height=value;
                  });
                   }
                   ),
                ],
              ),
            ),
          ),
            ),
        Expanded(
          child:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children:[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[300],
                    ),
                    child:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text('Weight',style: TextStyle(fontSize: 20,),),
                        Text('$weight',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),
                         ),
                          Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                         FloatingActionButton(
                          mini: true,
                          child: Icon(Icons.remove),
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                         ),
                         FloatingActionButton(
                          mini: true,
                          child: Icon(Icons.add),
                          onPressed:(){
                            setState((){
                              weight++;
                            });
                          },
                         ),
                      ],
                      ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 20.0,),
                Expanded(
                  child: Container(
                   decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.grey[300],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children:[
                        Text('Age',style:TextStyle(fontSize: 20,),),
                         Text('$age',style:TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                         Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
                         FloatingActionButton(
                          mini: true,
                          child: Icon(Icons.remove),
                          onPressed: (){
                            setState((){
                              age--;
                            });
                          },
                         ),
                         FloatingActionButton(
                          mini: true,
                          child: Icon(Icons.add),
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                         ),
                        ],
                       ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
            ),
        
        Container(
          width:double.infinity,
          color:Colors.blue,
          child:MaterialButton(
            onPressed:(){
              double result = weight/pow(height/100,2);
              print(result.round());

              Navigator.push(
                context,
                 MaterialPageRoute(
                  builder: (context)=>Bmi_result_Screen(
                       result: result.round(),
                       ismale: ismale,
                       age: age
                      ),
                  ),
                  );
            },
            height: 50.0,
            child: Text('calculate',style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
        ),

      ],),
      
    );
  }
}