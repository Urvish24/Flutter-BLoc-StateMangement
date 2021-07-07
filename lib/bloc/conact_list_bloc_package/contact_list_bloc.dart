
import 'package:contactapp/bloc/conact_list_bloc_package/contact_list_event.dart';
import 'package:contactapp/bloc/conact_list_bloc_package/contact_list_state.dart';
import 'package:contactapp/models/conlist_model.dart';
import 'package:contactapp/repositories/contact_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactListBloc extends Bloc<ContactListEvent,ContactListState>{

  ContactRepository contactRepository;
  ContactModel _contactModel;
   List<ContactList> list;

  ContactListBloc({@required this.contactRepository}) : super(InitialState());

  @override
  Stream<ContactListState> mapEventToState(ContactListEvent event) async* {

    if(event is FetchContactListEvent){
      yield* mapContactEventToState(event);
    }else if(event is UpdateContactListEvent){
      yield* mapUpdateContactEventToState(event);
    }

  }

  Stream<ContactListState> mapContactEventToState(FetchContactListEvent event) async*{
    yield LoadingState();

    try{
      _contactModel = await contactRepository.fetchContactListData();
      list = _contactModel.contactList;
      yield LoadedState(list);
    }catch(e){
      yield ErrorState(e.toString());
    }
  }

  Stream<ContactListState> mapUpdateContactEventToState(UpdateContactListEvent event) async*{

    try{

      //list = _contactModel.contactList;
      yield LoadedState(event.list);
    }catch(e){
      yield ErrorState(e.toString());
    }
  }



}