part of 'notificationlist_bloc.dart';

abstract class NotificationlistState extends Equatable {
  const NotificationlistState([List props = const []]) : super();
}

class NotificationlistInitial extends NotificationlistState {
  @override
  List<Object> get props => [];
}

class LoadingState extends NotificationlistState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends NotificationlistState {
  final List<NotificationList> list;
  //final ContactModel  conactModel;
  LoadedState(this.list);

  @override
  // TODO: implement props
  List<Object> get props => [list];
}



class ErrorState extends NotificationlistState {

  String msg;
  ErrorState(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}
