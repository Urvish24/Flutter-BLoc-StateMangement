part of 'bottom_package_bloc.dart';

@immutable
abstract class BottomPackageState {
  final int isIndex;

  BottomPackageState({this.isIndex});

}

class BottomPackageInitial extends BottomPackageState {
  BottomPackageInitial():super(isIndex : 0);
}

class NewBottomPackageState extends BottomPackageState{
  NewBottomPackageState.fromOldBottomPackageState(BottomPackageState oldState,
      {int isIndex})
      : super(
    isIndex: isIndex ?? oldState.isIndex,
  );
}