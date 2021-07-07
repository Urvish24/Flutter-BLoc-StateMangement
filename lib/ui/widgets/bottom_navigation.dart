import 'package:contactapp/animations/AnimatedIndexedStack.dart';
import 'package:contactapp/bloc/bottom_package_bloc.dart';
import 'package:contactapp/constant/constants.dart';
import 'package:contactapp/ui/pages/account.dart';
import 'package:contactapp/ui/pages/contact.dart';
import 'package:contactapp/ui/pages/deskboard.dart';
import 'package:contactapp/ui/pages/notification.dart';
import 'package:contactapp/ui/widgets/SafeArea_custom.dart';
import 'package:contactapp/ui/widgets/bottom_item.dart';
import 'package:contactapp/ui/widgets/contact_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';

class BottomParent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomPackageBloc(),
      child: Bottom_navigator(),
    );
  }
}


class Bottom_navigator extends StatefulWidget  {
  @override
  _Bottom_navigatorState createState() => _Bottom_navigatorState();
}

class _Bottom_navigatorState extends State<Bottom_navigator> {
 // int _index = 0;
  int _temp= 0;
  final _resumeDetectorKey = UniqueKey();
  BottomPackageBloc _bottomPackageBloc;

  @override
  Future<void> initState() {
    super.initState();
    _bottomPackageBloc=  BlocProvider.of<BottomPackageBloc>(context);

  }
  Future<void> tap(index) async {

    _bottomPackageBloc.add(Ind(index));

      /*setState(() {
        _index = index;
      });*/
  }

  var arr = [DeskBoardParent(),ContactTab(),DeskBoardParent(),NotificationParent(),Account()];
  @override
  Widget build(BuildContext context) {
    Widget child;
    Future<bool> _onWillPop(_index) async {
      print('data '+_index.toString());
      if(_index == 0){
        SystemNavigator.pop();
      }else{
        _bottomPackageBloc.add(Ind(0));
      }
    }
    return BlocBuilder<BottomPackageBloc, BottomPackageState>(
    builder: (context, state){
      return   Container(
        color: Colors.white,
        child: SafeArea(
          top: false,
          child: WillPopScope(
            onWillPop: ()=>_onWillPop(state.isIndex),
            child: Scaffold(
              body:AnimatedIndexedStack(
                index: state.isIndex,
                children:  arr,
              ),
              bottomNavigationBar: FocusDetector(
                key: _resumeDetectorKey,
                onFocusGained: () {
                  /* this.setState((){
                    _temp=0;
                  });*/
                },
                onFocusLost: () {},
                child: Container(
                  color: Color.fromRGBO(243, 243, 243, 1),
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Bottom_item(() => tap(0), 0, state.isIndex, creditCard,'Home'),
                      Bottom_item(() => tap(1), 1, state.isIndex, men,'Contatcs'),
                      Bottom_item(() => tap(2), 2, state.isIndex, camera,'Camera'),
                      Bottom_item(() => tap(3), 3, state.isIndex, noti,'Notification'),
                      Bottom_item(() => tap(4), 4, state.isIndex, social,'Account'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );

    },
    );
  }
}