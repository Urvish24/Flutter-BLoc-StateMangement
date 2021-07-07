import 'package:contactapp/ui/widgets/app_widgets.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:contactapp/bloc/notification_bloc/notificationlist_bloc.dart';
import 'package:contactapp/datasource/contact_data_source.dart';
import 'package:contactapp/repositories/contact_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationParent extends StatelessWidget {
  final ContactRepository contactRepository = ContactRepository(ContactDataSource());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationlistBloc(contactRepository: contactRepository),
      child: Notofication(),
    );
  }
}

class Notofication extends StatefulWidget {
  @override
  _NotoficationState createState() => _NotoficationState();
}

class _NotoficationState extends State<Notofication> {

  NotificationlistBloc _notifiactionBloc;
  final _resumeDetectorKey = UniqueKey();

  @override
  void initState() {
    super.initState();
    _notifiactionBloc =  BlocProvider.of<NotificationlistBloc>(context);
    _notifiactionBloc.add(FetchNotificationListEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FocusDetector(
        key: _resumeDetectorKey,
        onFocusGained: () {
          _notifiactionBloc.add(FetchNotificationListEvent());
        },
        child: Container(
          child: BlocBuilder<NotificationlistBloc,NotificationlistState>(
            builder: (context, state) {
             if(state is LoadedState){
               print('LIST ,'+state.list.length.toString());
             }else if(state is LoadingState){
               return buildLoadingUi();
             }
              return Container();
            }
          ),
        ),
      ),
    );
  }
}

