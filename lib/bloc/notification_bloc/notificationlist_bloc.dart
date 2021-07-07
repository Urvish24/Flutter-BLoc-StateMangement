import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:contactapp/models/notification_model.dart';
import 'package:contactapp/repositories/contact_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'notificationlist_event.dart';
part 'notificationlist_state.dart';

class NotificationlistBloc extends Bloc<NotificationlistEvent, NotificationlistState> {
  ContactRepository contactRepository;
  NotificationModel _notificationModel;
  List<NotificationList> list;

  NotificationlistBloc({@required this.contactRepository}) : super(NotificationlistInitial());

  @override
  Stream<NotificationlistState> mapEventToState(
    NotificationlistEvent event,
  ) async* {
    if(event is FetchNotificationListEvent){
      yield* mapContactEventToState(event);
    }
  }

  Stream<NotificationlistState> mapContactEventToState(FetchNotificationListEvent event) async*{
    yield LoadingState();

    try{
      _notificationModel = await contactRepository.fetchNotificationListData();
      list = _notificationModel.notificationList;
      yield LoadedState(list);
    }catch(e){
      yield ErrorState(e.toString());
    }
  }
}
