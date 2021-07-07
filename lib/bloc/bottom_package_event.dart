part of 'bottom_package_bloc.dart';

@immutable
abstract class BottomPackageEvent {
  final dynamic payload;

  BottomPackageEvent(this.payload);
}

class Ind extends BottomPackageEvent{
  Ind(int payload) : super(payload);
}
