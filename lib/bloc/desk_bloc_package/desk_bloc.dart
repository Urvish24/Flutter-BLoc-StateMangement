

import 'package:contactapp/bloc/desk_bloc_package/desk_event.dart';
import 'package:contactapp/bloc/desk_bloc_package/desk_state.dart';
import 'package:contactapp/models/deskboard_model.dart';
import 'package:contactapp/models/share_model.dart';
import 'package:contactapp/repositories/contact_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeskBloc extends Bloc<DeskEvent,DeskState>{

  ContactRepository contactRepository;

  DeskBloc({@required this.contactRepository}) : super(InitialState());

  @override
  Stream<DeskState> mapEventToState(DeskEvent event) async* {
   if(event is FetchDeskDataEvent){
     yield* mapContactEventToState(event);
   }else if(event is ShareEvent){
     yield* mapShareEventToState(event);
   }
  }

  Stream<DeskState> mapContactEventToState(FetchDeskDataEvent event) async*{
    yield LoadingState();

    try{
      DeskModel summary = await contactRepository.fetchDeskBoardData();
      yield LoadedState(summary);
    }catch(e){
      yield ErrorState(e.toString());
    }
  }

  Stream<DeskState> mapShareEventToState(ShareEvent event) async*{
    yield ShareLoadingState();

    try{
      ShareModel summary = await contactRepository.shareNumberData(event.mNo);
      yield ShareLoadedState(summary);
    }catch(e){
      yield ErrorState(e.toString());
    }
  }

}