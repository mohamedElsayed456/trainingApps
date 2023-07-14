import 'package:flutter/material.dart';


class Bmi_result_Screen extends StatelessWidget {
  final int result;
  final bool ismale;
  final int age;

  Bmi_result_Screen({
   required this.result,
   required this.ismale,
   required this.age,
   
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bmi Result'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender:${ismale? 'male': 'female'}',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text('Result:$result',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            Text('Age:$age',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}