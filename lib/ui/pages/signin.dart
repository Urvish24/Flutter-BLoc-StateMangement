import 'package:contactapp/bloc/login_bloc_package/login_bloc.dart';
import 'package:contactapp/bloc/login_bloc_package/login_event.dart';
import 'package:contactapp/bloc/login_bloc_package/login_state.dart';
import 'package:contactapp/datasource/StorageUtil.dart';
import 'package:contactapp/datasource/contact_data_source.dart';
import 'package:contactapp/repositories/contact_repository.dart';
import 'package:contactapp/ui/pages/deskboard.dart';
import 'package:contactapp/ui/widgets/KeyboardManger.dart';
import 'package:contactapp/ui/widgets/app_widgets.dart';
import 'package:contactapp/ui/widgets/bottom_navigation.dart';
import 'package:contactapp/ui/widgets/button.dart';
import 'package:contactapp/ui/widgets/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPageParent extends StatelessWidget {
  final ContactRepository contactRepository = ContactRepository(ContactDataSource());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(contactRepository: contactRepository),
      child: SignIn(),
    );
  }
}

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerPswd = TextEditingController();
  final _focusEmail = FocusNode();
  final _focusPswd = FocusNode();
  LoginBloc loginBloc;


  @override
  void initState() {
    super.initState();
    loginBloc =  BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Wrap(
          children: <Widget>[
            EditText(placeholder: 'Email',controller: _controllerEmail,focus: _focusEmail,
              keybord: TextInputType.emailAddress,nextfocus: _focusPswd,),
            EditText(placeholder: 'Password',controller: _controllerPswd,focus: _focusPswd,nextfocus: _focusPswd,
                obscureText: true),
            Container(
                child: BlocListener<LoginBloc,LoginState>(
                  listener: (context, state) {
                    if(state is LoadedState){
                      if(state.loginmodel.status.toString() == "true"){
                        StorageUtil.getInstance().then((value) =>{
                        StorageUtil.putString('uid',state.loginmodel.userProfile.userId.toString()),
                        StorageUtil.putBool('isAuthenticate', true),
                        _preesed()
                        });
                      }else{
                        final snackBar = SnackBar(content: Text('Sorry! Cant Login!'));
                        Scaffold.of(context).showSnackBar(snackBar);
                      }
                     }
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                      builder: (context, state) {
                        if(state is InitialState){
                          return buildLoginBtnUi();
                        }else if(state is LoadingState){
                          return buildLoginBtnUiLoaded();
                        }else if(state is LoadedState){
                          print('Model, '+state.loginmodel.status.toString());
                          return buildLoginBtnUiLoaded();
                        }else  if(state is ErrorState){
                          return  buildLoginBtnUi();
                        }else{
                          return  buildLoginBtnUi();
                        }
                      }
                  ),
                ),
              ),

          ],
        ),
      ),
    );
  }



  Widget buildLoginBtnUi(){
    return  RisedButtonuv(title: 'LogIn',onTap: () => _buttonPressed(),loading: false,);
  }


  void _preesed(){
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return BottomParent();}));
  }



  Widget buildLoginBtnUiLoaded(){
    return  RisedButtonuv(title: 'LogIn',onTap: ()=>{},loading: true,);
  }

  void _buttonPressed(){
    var map = new Map<String, dynamic>();
    map["username"] = _controllerEmail.text ;
    map["password"] = _controllerPswd.text ;
    loginBloc.add(FetchLoginDataEvent(hashMap: map));
  }
}
