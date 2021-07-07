 import 'package:contactapp/constant/constants.dart';
import 'package:contactapp/ui/widgets/SafeArea_custom.dart';
import 'package:flutter/material.dart';

class Account extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return Column(
       children: <Widget>[
         Container(
           height: MediaQuery.of(context).size.height/3,
           width: MediaQuery.of(context).size.width,
           color: Theme.of(context).primaryColor,
           child: Center(
             child: Card(
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(50.0),
               ),
               child: Image.asset(social,height: 100,width: 100,),
             ),
           ),
         )
       ],
     );
   }
 }
