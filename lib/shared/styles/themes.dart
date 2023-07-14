import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hexcolor/hexcolor.dart';

import 'colors.dart';

ThemeData LightTheme= ThemeData(
          primarySwatch: DefaulColor,
          scaffoldBackgroundColor: Colors.white,
          bottomNavigationBarTheme: BottomNavigationBarThemeData( 
            type:BottomNavigationBarType.fixed, 
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            backgroundColor:Colors.white,
            elevation: 20.0,
            ),
          appBarTheme: AppBarTheme( 
            titleSpacing: 20,
            iconTheme: IconThemeData(color: Colors.black),
            titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize:20.0,
            fontWeight: FontWeight.bold,
            ),
            backgroundColor: Colors.white,
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness:Brightness.dark,
          ),
          ),
          textTheme: TextTheme(
           bodyText1: TextStyle(
            fontSize:20,
            fontWeight:FontWeight.bold ,
            color: Colors.black,
           ), 
          ),
      );

ThemeData DarkTheme=ThemeData(
           primarySwatch:  DefaulColor ,
           scaffoldBackgroundColor:  HexColor('333739'),
           bottomNavigationBarTheme: BottomNavigationBarThemeData( 
            type:BottomNavigationBarType.fixed, 
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: Colors.grey,
            backgroundColor: HexColor('333739'),
            elevation: 20.0,
            ),
           appBarTheme: AppBarTheme( 
            titleSpacing: 20,
          iconTheme: IconThemeData(color: Colors.white),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize:20.0,
            fontWeight: FontWeight.bold,
            ),
          backgroundColor: HexColor('333739'),
          elevation: 0.0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: HexColor('333739'),
            statusBarIconBrightness:Brightness.light,
          ),
          ),
           textTheme:TextTheme(
           bodyText1:TextStyle(
            fontSize:20,
            fontWeight:FontWeight.bold,
            color:Colors.white,
           ), 
          ),
      );