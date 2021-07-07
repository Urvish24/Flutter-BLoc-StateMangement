import 'package:contactapp/models/login_model.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {}


class InitialState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends LoginState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends LoginState {

  LoginModel  loginmodel;
  LoadedState(this.loginmodel);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ErrorState extends LoginState {

  String msg;
  ErrorState(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}