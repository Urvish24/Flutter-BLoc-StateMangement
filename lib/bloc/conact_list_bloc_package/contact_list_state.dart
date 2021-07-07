import 'package:contactapp/models/conlist_model.dart';
import 'package:equatable/equatable.dart';

abstract class ContactListState extends Equatable {

  ContactListState([List props = const []]) : super();
}


class InitialState extends ContactListState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends ContactListState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends ContactListState {
  final List<ContactList> list;
  //final ContactModel  conactModel;
  LoadedState(this.list);

  @override
  // TODO: implement props
  List<Object> get props => [list];
}



class ErrorState extends ContactListState {

  String msg;
  ErrorState(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class TapState extends ContactListState {

  bool tap;
  TapState(this.tap);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}