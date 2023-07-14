import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:udemy_abdallah/modules/shop_app/login/shop_login_screen.dart';
import 'package:udemy_abdallah/shared/components/components.dart';
import 'package:udemy_abdallah/shared/network/local/cashe_helper.dart';

import '../../../shared/styles/colors.dart';

class BoardingModel{
  final String image;
  final String Title;
  final String body;

  BoardingModel({
    required this.image,
    required this.Title,
    required this.body,
  });
}

class OnBoardingView extends StatefulWidget{

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
var BoardController=PageController();

List<BoardingModel>boarding=[
  BoardingModel(
    image: 'assets/images/onboard _1.jpg', 
    Title: 'On Board 1 Title',
     body: 'On Board 1 Body',
     ),
  BoardingModel(
    image: 'assets/images/onboard_2.jpg', 
    Title: 'On Board 2 Title',
     body: 'On Board 2 Body',
     ),
  BoardingModel(
    image: 'assets/images/onboard_3.jpg', 
    Title: 'On Board 3 Title',
     body: 'On Board 3  Body',
     ),
];

bool islast=false;

void submit(){
  CasheHelper.saveData(key: 'onBoarding', value: true).then((value){
    if(value){
      navigateandfinish(
      context,
     ShopLoginScreen(),
   );
    }
  });
   navigateandfinish(
      context,
     ShopLoginScreen(),
   );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(

        actions: [
          defaulttextbutton(
            function:submit,
             text:
             (
              'SKIP'
             ),
          ),
        ],
      ),
    
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(

          children: [

            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                controller: BoardController,
                onPageChanged:(int index){
                  if(index==boarding.length-1){
                    setState(() {
                      islast=true;
                    });
                  }else{
                    setState(() {
                      islast=false;
                    });
                  }
                } ,
                itemBuilder:(BuildContext context, index)=>Buildingboardingitem(boarding[index]),
                itemCount: boarding.length,
              ),
              ),
              SizedBox(height: 40,),
            Row(
                children:[
                SmoothPageIndicator(
                  controller:BoardController,
                   count: boarding.length,
                   effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    expansionFactor: 4,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5,
                    activeDotColor:DefaulColor,
                    ),
                   ),
                  
                Spacer(),
                  
                FloatingActionButton(
                    onPressed: (){
                      if(islast){
                        submit();
                      }else{
                      BoardController.nextPage(
                        duration: Duration(
                          milliseconds: 750,
                        ),
                         curve:Curves.fastLinearToSlowEaseIn,
                         );
                      }
                      },
                    child: Icon(
                      Icons.arrow_forward_ios,
                      ),
                    )
                ],
              )
          ],
        ),
      )
   );
  }

Widget Buildingboardingitem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image(
              image: AssetImage('${model.image}'),
              fit: BoxFit.cover,
              ),
          ),
            SizedBox(height: 30,),
            Text(
              '${model.Title}',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
                ),
                ),
            SizedBox(height: 15,),
            Text(
              '${model.body}',
              style: TextStyle(
                fontSize: 14,
                ),
                ),
            SizedBox(height: 30,),    
        ],
      );
}