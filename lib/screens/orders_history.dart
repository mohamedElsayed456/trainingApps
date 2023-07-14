import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


class OrdersHistoryScreen extends StatelessWidget{
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Orders History',)),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height:130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:Border.all(color:Color.fromARGB(195, 217, 217, 217),),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 180),
                          child: Text(
                            '2:24pm 20/03/2023',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10
                            ),
                            ),
                        ),
                         Padding(
                           padding: const EdgeInsets.only(left: 230),
                           child: Text(
                            '#134',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                         ),
                          Row(
                            children: [
                              Text('x1',style: TextStyle(fontSize: 10),),
                              SizedBox(width: 6,),
                              Text('Alternator',style: TextStyle(fontSize: 17),),
                              Spacer(),
                              Text('200L.E',style: TextStyle(fontSize: 8),),
                            ],
                          ),
                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Text('x2',style: TextStyle(fontSize: 10),),
                              SizedBox(width: 6,),
                              Text('Projector',style: TextStyle(fontSize: 17),),
                              Spacer(),
                              Text('150L.E',style: TextStyle(fontSize: 8),),
                            ],
                          ),
                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Text('Total',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Spacer(),
                              Text('500L.E',style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                                ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 80,
                  child: Text('Cancelled',textAlign: TextAlign.center,),
                  
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight:Radius.zero,
                    bottomLeft: Radius.zero,
                    topLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                    ),
                  color:const Color.fromARGB(255, 183, 58, 64)
                  ),
                )
              ],
            ),
            
            SizedBox(height: 30,),

            Stack(
              children: [
                Container(
                  height:130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:Border.all(color:Color.fromARGB(195, 217, 217, 217),),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 180),
                          child: Text(
                            '2:24pm 20/03/2023',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10
                            ),
                            ),
                        ),
                         Padding(
                           padding: const EdgeInsets.only(left: 230),
                           child: Text(
                            '#134',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                         ),
                          Row(
                            children: [
                              Text('x1',style: TextStyle(fontSize: 10),),
                              SizedBox(width: 6,),
                              Text('Alternator',style: TextStyle(fontSize: 17),),
                              Spacer(),
                              Text('200L.E',style: TextStyle(fontSize: 8),),
                            ],
                          ),
                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Text('x2',style: TextStyle(fontSize: 10),),
                              SizedBox(width: 6,),
                              Text('Projector',style: TextStyle(fontSize: 17),),
                              Spacer(),
                              Text('150L.E',style: TextStyle(fontSize: 8),),
                            ],
                          ),
                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Text('Total',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Spacer(),
                              Text('500L.E',style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                                ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 80,
                  child: Text('Pending',textAlign: TextAlign.center,),
                  
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight:Radius.zero,
                    bottomLeft: Radius.zero,
                    topLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                    ),
                  color:Colors.blueGrey,
                  ),
                )
              ],
            ),
              
            SizedBox(height: 30,), 

            Stack(
              children: [
                Container(
                  height:130,
                  width: double.infinity,
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border:Border.all(color:Color.fromARGB(195, 217, 217, 217),),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 180),
                          child: Text(
                            '2:24pm 20/03/2023',
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10
                            ),
                            ),
                        ),
                         Padding(
                           padding: const EdgeInsets.only(left: 230),
                           child: Text(
                            '#134',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                            ),
                            ),
                         ),
                          Row(
                            children:[
                              Text('x1',style: TextStyle(fontSize: 10),),
                              SizedBox(width:6,),
                              Text('Alternator',style: TextStyle(fontSize: 17),
                              ),
                              Spacer(),
                              Text('200L.E',style: TextStyle(fontSize: 8),
                              ),
                            ],
                          ),
                          SizedBox(height: 6,),
                          Row(
                            children:[
                              Text('x2',style: TextStyle(fontSize: 10),),
                              SizedBox(width: 6,),
                              Text('Projector',style: TextStyle(fontSize: 17),),
                              Spacer(),
                              Text('150L.E',style: TextStyle(fontSize: 8),),
                            ],
                          ),
                          SizedBox(height: 6,),
                          Row(
                            children: [
                              Text('Total',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                              Spacer(),
                              Text('500L.E',style: TextStyle(
                                color: Colors.black45,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                                ),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 20,
                  width: 80,
                  child: Text('Delivered',textAlign: TextAlign.center,),
                  
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight:Radius.zero,
                    bottomLeft: Radius.zero,
                    topLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)
                    ),
                  color:Colors.green,
                  ),
                )
              ],
            ), 
          ],
        ),
      ),
    );
  }
}