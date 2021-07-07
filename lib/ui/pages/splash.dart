 import 'dart:async';

import 'package:contactapp/bloc/login_bloc_package/login_bloc.dart';
import 'package:contactapp/datasource/StorageUtil.dart';

import 'package:contactapp/ui/pages/deskboard.dart';
import 'package:contactapp/ui/pages/signin.dart';
import 'package:contactapp/ui/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:contactapp/constant/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 
class Splash_screen extends StatefulWidget {
  @override
  _Splash_screenState createState() => _Splash_screenState();
}

class _Splash_screenState extends State<Splash_screen> {
  @override
  Future<void> initState()  {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: appColor,
        statusBarIconBrightness: Brightness.dark
    ));


    StorageUtil.getInstance().then((_) {
      bool tocken =  StorageUtil.getBoolen("isAuthenticate");
      print('TOCKEN '+tocken.toString());
      if(tocken == false){
        Timer(Duration(seconds: 3),
                () =>Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return SignInPageParent();})));
      }else{
        Timer(Duration(seconds: 3),
                () =>Navigator.of(context).push(MaterialPageRoute(builder: (_) {
              return BottomParent();})));
      }
    });

  }
  Future waitForMe() async {
    StorageUtil.getInstance();
  }
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       body: Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: <Widget>[
               Container(
                 height: 100,
                 width: 100,
                 margin: EdgeInsets.only(bottom: 20),
                 child: Image.asset(
                   logo,
                   fit: BoxFit.fill,
                   color: appColor,
                 ),
               ),
               Text(app_name,style: TextStyle(color: appColor,fontSize: 30,fontWeight:FontWeight.bold),)
             ],
           ),
         ),),
     );
   }
}
 