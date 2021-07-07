import 'package:contactapp/models/deskboard_model.dart';
import 'package:contactapp/models/login_model.dart';
import 'package:contactapp/models/share_model.dart';
import 'package:equatable/equatable.dart';

abstract class DeskState extends Equatable {}


class InitialState extends DeskState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadingState extends DeskState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class LoadedState extends DeskState {
 final DeskModel  deskModel;
  LoadedState(this.deskModel);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ErrorState extends DeskState {

  String msg;
  ErrorState(this.msg);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ShareLoadingState extends DeskState{
  ShareLoadingState();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class ShareLoadedState extends DeskState{
 ShareModel  shareModel;
  ShareLoadedState(this.shareModel);
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}

class ShareErrorState extends DeskState{
  String msg;
  ShareErrorState(this.msg);
  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();
}