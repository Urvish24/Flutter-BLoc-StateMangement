import 'package:contactapp/bloc/desk_bloc_package/desk_bloc.dart';
import 'package:contactapp/bloc/login_bloc_package/login_bloc.dart';
import 'package:contactapp/datasource/contact_data_source.dart';
import 'package:contactapp/repositories/contact_repository.dart';
import 'package:contactapp/ui/pages/signin.dart';
import 'package:contactapp/ui/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  final ContactRepository contactRepository = ContactRepository(ContactDataSource());
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(255, 39, 68, 1),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:  Splash_screen(),
    );
  }
}
