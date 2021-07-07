import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class LoginEvent extends Equatable {}


class FetchLoginDataEvent extends LoginEvent {

  var hashMap;

  FetchLoginDataEvent({@required this.hashMap});

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}