part of 'contact_bloc.dart';

@immutable
abstract class ContactEvent {
  final dynamic payload;
  ContactEvent(this.payload);
}

class Click extends ContactEvent {
  Click(bool payload) : super(payload);
}

class Updated extends ContactEvent{
  Updated(List<ContactList> payload) : super(payload);

}