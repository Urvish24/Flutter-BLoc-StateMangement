part of 'contact_bloc.dart';

@immutable
abstract class ContactState {
  final bool isClick;
  final List<ContactList> list;
  ContactState({this.isClick,this.list});

}

class ContactInitial extends ContactState {

  ContactInitial(): super(isClick: false,list: []);
}


class NewContactState extends ContactState {
  NewContactState.fromOldContactState(ContactState oldState,
      {bool isClick,List<ContactList> list})
      : super(
    isClick: isClick ?? oldState.isClick,
    list : list ?? oldState.list
  );
}