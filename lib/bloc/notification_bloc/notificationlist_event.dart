part of 'notificationlist_bloc.dart';

abstract class NotificationlistEvent extends Equatable {
  const NotificationlistEvent();
}

class FetchNotificationListEvent extends NotificationlistEvent {

  FetchNotificationListEvent();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}
