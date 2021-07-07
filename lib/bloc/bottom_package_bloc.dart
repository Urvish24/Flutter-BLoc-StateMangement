import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_package_event.dart';
part 'bottom_package_state.dart';

class BottomPackageBloc extends Bloc<BottomPackageEvent, BottomPackageState> {
  BottomPackageBloc() : super(BottomPackageInitial());

  @override
  Stream<BottomPackageState> mapEventToState(
    BottomPackageEvent event,
  ) async* {
    if (event is Ind) {
      yield NewBottomPackageState.fromOldBottomPackageState(state,
          isIndex:  event.payload);
    }
  }
}
