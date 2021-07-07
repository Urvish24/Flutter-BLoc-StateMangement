 import 'package:flutter/material.dart';
 import 'package:contactapp/constant/constants.dart';

class RisedButtonuv extends StatelessWidget {
  String title;
  GestureTapCallback onTap;
  bool loading;

  RisedButtonuv({this.title, this.onTap,this.loading = false});

  @override
   Widget build(BuildContext context) {
     return  Container(
       margin: EdgeInsets.all(10),
       child: SizedBox(
         width: double.infinity,
         child: RaisedButton(
           shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(5.0),
           ),
          splashColor: Colors.white.withOpacity(0.5),
           color: appColor,
           child: Container(margin: EdgeInsets.symmetric(vertical: 10),
               child: (!loading)?Text(title,style: button_style):CircularProgressIndicator(backgroundColor: Colors.white,
               valueColor: new AlwaysStoppedAnimation<Color>(appColor),)),
           onPressed: onTap,
         ),
       ),
     );
   }
 }
