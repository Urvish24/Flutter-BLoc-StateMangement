import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contactapp/models/conlist_model.dart';
import 'package:meta/meta.dart';

part 'contact_event.dart';
part 'contact_state.dart';

class ContactBloc extends Bloc<ContactEvent, ContactState> {
  ContactBloc() : super(ContactInitial());

  @override
  Stream<ContactState> mapEventToState(
    ContactEvent event,
  ) async* {
    if (event is Click) {
      yield NewContactState.fromOldContactState(state,
          isClick:  event.payload);
    }else if (event is Updated) {
      yield NewContactState.fromOldContactState(state,
          list: event.payload);
    }
  }
}
