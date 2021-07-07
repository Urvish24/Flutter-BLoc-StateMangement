import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class DeskEvent extends Equatable {}


class FetchDeskDataEvent extends DeskEvent {

  FetchDeskDataEvent();

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();

}

class ShareEvent extends DeskEvent {
  var mNo;
  ShareEvent(this.mNo);

  @override
  // TODO: implement props
  List<Object> get props => throw UnimplementedError();


}