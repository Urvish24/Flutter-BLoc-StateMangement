import 'package:contactapp/models/conlist_model.dart';
import 'package:equatable/equatable.dart';

abstract class ContactListEvent extends Equatable {}


class FetchContactListEvent extends ContactListEvent {

  FetchContactListEvent();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class UpdateContactListEvent extends ContactListEvent{
 final List<ContactList> list;

  UpdateContactListEvent(this.list);

  @override
  // TODO: implement props
  List<Object> get props => [list];



}
