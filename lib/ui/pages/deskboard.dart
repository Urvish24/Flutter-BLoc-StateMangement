import 'package:contactapp/bloc/desk_bloc_package/desk_bloc.dart';
import 'package:contactapp/bloc/desk_bloc_package/desk_event.dart';
import 'package:contactapp/bloc/desk_bloc_package/desk_state.dart';
import 'package:contactapp/constant/constants.dart';
import 'package:contactapp/datasource/StorageUtil.dart';
import 'package:contactapp/datasource/contact_data_source.dart';
import 'package:contactapp/models/deskboard_model.dart';
import 'package:contactapp/repositories/contact_repository.dart';
import 'package:contactapp/ui/widgets/KeyboardManger.dart';
import 'package:contactapp/ui/widgets/SafeArea_custom.dart';
import 'package:contactapp/ui/widgets/app_widgets.dart';
import 'package:contactapp/ui/widgets/button.dart';
import 'package:contactapp/ui/widgets/textfield.dart';
import 'package:contactapp/ui/widgets/tiles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeskBoardParent extends StatelessWidget {
  final ContactRepository contactRepository = ContactRepository(ContactDataSource());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => DeskBloc(contactRepository:  contactRepository),
      child: DeskBoard(),
    );
  }
}


class DeskBoard extends StatefulWidget {
   @override
   _DeskBoardState createState() => _DeskBoardState();
 }

 class _DeskBoardState extends State<DeskBoard> {
   MediaQueryData get mediaQuery => MediaQuery.of(context);
   DeskBloc _deskBloc;
   DeskModel _deskModel;
   TextEditingController _controllerNumber = TextEditingController();
   final _focusNumber = FocusNode();
   @override
   void initState() {
     super.initState();
     _deskBloc = BlocProvider.of<DeskBloc>(context);
     _deskBloc.add(FetchDeskDataEvent());
   }

   @override
   Widget build(BuildContext context) {
     return
       SafeArea_custom(
         child: Scaffold(
           body: Container(
             color: graisss,
             height: mediaQuery.size.height-MediaQuery.of(context).padding.top,
             child: BlocBuilder<DeskBloc,DeskState>(
               builder: (c,state){
                 if(state is InitialState){
                   return buildLoadingUi();
                 }else if(state is LoadingState){
                   return buildLoadingUi();
                 }else if(state is LoadedState){
                   _deskModel=state.deskModel;
                  // print('Model, '+state.deskModel.shareCount.toString());
                   return _cardUi(state.deskModel);
                 }else  if(state is ErrorState){
                   return buildErrorUi(state.msg);
                 }else  if(state is ShareLoadingState){
                   return _cardUi(_deskModel);
                 }else  if(state is ShareLoadedState){
                   _controllerNumber.text="";
                   return _cardUi(_deskModel);
                 }else{
                   return SizedBox();
                 }
               },
             ),
           ),
         ),
       );
   }

   Widget _cardUi(DeskModel deskModel){
     Color _tempColor = Colors.orange;
     if(deskModel.selectedTamplet == '1'){_tempColor = appColor;}
     TextStyle _normalText = TextStyle(color: _tempColor,letterSpacing: 1);
     return Container(
       child: BlocListener<DeskBloc,DeskState>(
         listener: (context, state) {
           if(state is ShareLoadedState){
             final snackBar = SnackBar(content: Text(state.shareModel.message));
             Scaffold.of(context).showSnackBar(snackBar);
           }
         },
         child:  KeyboardManger(
           child: Stack(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Tiles(value: deskModel.shareCount.toLowerCase(),name:'SHARES'),
                      Tiles(value: deskModel.viewCount.toLowerCase(),name:'VIEWS'),
                      Tiles(value: deskModel.contactCount.toLowerCase(),name:'CONTACTS'),
                    ],
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Card(
                            elevation: 2,
                            margin: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 280,
                                  color: Colors.black,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                          height: 140,
                                          color: _tempColor),
                                      Container(
                                          height: 140,
                                          color: Colors.white),
                                    ],
                                  ),
                                ),
                                Container(
                                    height: 280,
                                    margin: EdgeInsets.symmetric(horizontal: 20),
                                    child: Center(
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                            decoration: BoxDecoration(border: Border.all(color: _tempColor,width: 2)),
                                            padding: EdgeInsets.all(.5),
                                            child: Card(
                                              child: Image.network(BaseUrl_image+deskModel.cardDetail.photo,width: 120,height: 120,
                                                fit: BoxFit.fill,),
                                            ),
                                          ),
                                          SizedBox(width: 20),
                                          Column(
                                            mainAxisSize: MainAxisSize.min,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Container(
                                                height: 60,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: <Widget>[
                                                    Text(deskModel.cardDetail.firstName+' '+deskModel.cardDetail.lastName,style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w600)),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                height: 60,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(deskModel.cardDetail.designation,style: TextStyle(color: _tempColor,fontSize: 20,fontWeight: FontWeight.w600)),
                                                    Text(deskModel.cardDetail.department,style: TextStyle(color: _tempColor,fontSize: 16,fontWeight: FontWeight.w500)),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    )
                                ),
                                Container(
                                  height: 280,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Container(
                                        height: 70,
                                        margin: EdgeInsets.symmetric(horizontal: 20),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          crossAxisAlignment: CrossAxisAlignment.stretch,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Expanded(child: Wrap(children: <Widget>[smallImg(telePhone),Text(deskModel.cardDetail.phoneNumber1,style: _normalText,)] )),
                                                Expanded(child: Wrap(children: <Widget>[smallImg(smartPhone),Text(deskModel.cardDetail.mobile,style: _normalText,)] )),
                                              ],
                                            ),
                                            Wrap(children: <Widget>[smallImg(telePhone),Text(deskModel.cardDetail.phoneNumber2,style: _normalText,)]),
                                            Wrap(children: <Widget>[smallImg(email),Text(deskModel.cardDetail.userEmail,style: _normalText,)]),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height: 10),
                              Image.network(BaseUrl_image+deskModel.cardDetail.companyLogo,width: 120,height: 120, fit: BoxFit.fill,),
                              SizedBox(height: 10),
                              Text(deskModel.cardDetail.company,style: TextStyle(color: _tempColor,fontSize: 17,fontWeight: FontWeight.w600)),
                              SizedBox(height: 20),
                              Container(width: double.infinity,height: 1,color: Colors.black,),
                              SizedBox(height: 20),
                              Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(child: Wrap(children: <Widget>[smallImg(telePhone),Text(deskModel.cardDetail.phoneNumber1,style: _normalText,)] )),
                                    Expanded(child: Wrap(children: <Widget>[smallImg(smartPhone),Text(deskModel.cardDetail.mobile,style: _normalText,)] )),
                                  ],
                                ),
                              ),
                              SizedBox(height: 10),
                              Row(
                                  children: <Widget>[smallImg(internet),Text(deskModel.cardDetail.companyWebsite,style: _normalText,)] )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                ],
              ),
               Positioned(
                 bottom: 0,
                 child: Container(
                   width: MediaQuery.of(context).size.width,
                   color: Colors.white,
                   child:  Column(
                     children: <Widget>[
                       EditText(placeholder: 'Type a mobile number',controller: _controllerNumber,focus: _focusNumber,
                         keybord: TextInputType.phone),
                       BlocBuilder<DeskBloc, DeskState>(
                         builder: (context, state){
                           if(state is ShareLoadingState){
                             return RisedButtonuv(onTap: (){},title: 'SHARE',loading: true);
                           }else if(state is ShareLoadedState){
                             print('Share ,'+state.shareModel.status.toString());
                             return RisedButtonuv(onTap: ()=> _shareData(),title: 'SHARE');
                           }else{
                             return RisedButtonuv(onTap: ()=> _shareData(),title: 'SHARE');
                           }
                         },
                       ),
                     ],
                   ),
                 ),
               )
            ],
           ),
         ),
       ),
     );
   }

   void _shareData(){
     StorageUtil.getInstance();
     var map = new Map<String, dynamic>();
     map["user_id"] = StorageUtil.getString('uid') ;
     map["mobile_number"] = _controllerNumber.text ;
     print('DATdf4524524A ,'+map.toString());
     _deskBloc.add(ShareEvent(map));

   }
 }
