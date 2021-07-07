import 'package:contactapp/bloc/conact_list_bloc_package/contact_list_bloc.dart';
import 'package:contactapp/bloc/conact_list_bloc_package/contact_list_event.dart';
import 'package:contactapp/bloc/conact_list_bloc_package/contact_list_state.dart';
import 'package:contactapp/bloc/contact_page_bloc/contact_bloc.dart';
import 'package:contactapp/constant/constants.dart';
import 'package:contactapp/datasource/contact_data_source.dart';
import 'package:contactapp/models/conlist_model.dart';
import 'package:contactapp/repositories/contact_repository.dart';
import 'package:contactapp/ui/widgets/app_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactPatent extends StatelessWidget {
  final ContactRepository contactRepository = ContactRepository(ContactDataSource());


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => ContactListBloc(contactRepository:  contactRepository),
        ),
        BlocProvider(
          create: (ctx) => ContactBloc(),
        )
      ], child: Contact());
  }
}

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  ContactListBloc  _contactListBloc;
  ContactBloc contactBloc;
  List<ContactList> _list;

  @override
  void initState() {
    _contactListBloc = BlocProvider.of<ContactListBloc>(context);
    _contactListBloc.add(FetchContactListEvent());
    contactBloc = BlocProvider.of<ContactBloc>(context);
  }
  @override
  Widget build(BuildContext context) {

    return BlocBuilder<ContactBloc, ContactState>(
    builder: (context, state){
      return   Scaffold(
        body: Column(
          children: <Widget>[
            Container(
              child: BlocBuilder<ContactListBloc,ContactListState>(
                  builder: (c,state){
                    if(state is InitialState){
                      return buildLoadingUi();
                    }else if(state is LoadingState){
                      return buildLoadingUi();
                    }else if(state is LoadedState){
                      _list=state.list;
                      return _contactListUi(state.list);
                    }else  if(state is ErrorState){
                      return buildErrorUi(state.msg);
                    }else{
                      return buildLoadingUi();
                    }
                  }
              ),
            ),

            GestureDetector(
               onTap: ()=> contactBloc.add(Click(!state.isClick)),
              child: Container(
                child: Text('NEWii',style: TextStyle(color:(state.isClick)?Colors.green:Colors.black),),
              ),
            ),
          ],
        ),
      );
    },
    );
  }

  Widget _contactListUi( List<ContactList> _conactList){
    return SingleChildScrollView(
      child:ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: _conactList.length,
        itemBuilder: (ctx, pos) {
        //  print('TAP ,'+_conactList[pos].tap.toString());
          return GestureDetector(
            onTap:()=> _updateIndex(pos),
            child: Card(
              child:Row(children: <Widget>[
                Text(_conactList[pos].name.replaceAll('\n', ''),style: TextStyle(color: (_conactList[pos].tap)?Colors.green:Colors.black),),
              ], ),
            ),
          );
        },
      ),
    );
  }


  void _updateIndex(int index){
    _list[index].tap =!_list[index].tap;
    contactBloc.add(Updated(_list));
    //_contactListBloc.add(UpdateContactListEvent(_list));
  }

}
