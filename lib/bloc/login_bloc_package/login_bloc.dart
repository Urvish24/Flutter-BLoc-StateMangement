

import 'package:contactapp/bloc/login_bloc_package/login_event.dart';
import 'package:contactapp/bloc/login_bloc_package/login_state.dart';
import 'package:contactapp/models/login_model.dart';
import 'package:contactapp/repositories/contact_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent,LoginState>{

  ContactRepository contactRepository;

  LoginBloc({@required this.contactRepository}) : super(InitialState());

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async*{
     if(event is FetchLoginDataEvent){
       yield* mapContactEventToState(event);
     }
  }


  Stream<LoginState> mapContactEventToState(FetchLoginDataEvent event) async*{
    yield LoadingState();

    try{
      LoginModel coronaSummary = await contactRepository.fetchLoginData(event.hashMap);
      yield LoadedState(coronaSummary);
    }catch(e){
      yield ErrorState(e.toString());
    }
  }
}