
import 'dart:convert';

import 'package:contactapp/datasource/StorageUtil.dart';
import 'package:contactapp/models/conlist_model.dart';
import 'package:contactapp/models/deskboard_model.dart';
import 'package:contactapp/models/notification_model.dart';
import 'package:contactapp/models/share_model.dart';
import 'package:http/http.dart' as http;
import 'package:contactapp/models/login_model.dart';
import 'package:contactapp/res/strings.dart';

class ContactDataSource{

  Future<LoginModel> postLogin(var body) async{
    var response = await http.post(AppStrings.loginUrl,body: body);
    if(response.statusCode == 200){
      var data = json.decode(response.body);
      LoginModel _loginData = LoginModel.fromJson(data);
      return _loginData;
    } else {
      throw Exception();
    }
  }

  Future<DeskModel> getDesk() async{
    StorageUtil.getInstance();
    var body =  new Map<String, dynamic>();
    body["user_id"] = StorageUtil.getString('uid') ;
    var response = await http.post(AppStrings.deskUrl,body: body);
    if(response.statusCode == 200){
      var data = json.decode(response.body);
      DeskModel _deskModel = DeskModel.fromJson(data);
      return _deskModel;
    } else {
      throw Exception();
    }
  }

  Future<ShareModel> postNumberData(var body) async{
    StorageUtil.getInstance();
    var response = await http.post(AppStrings.shareUrl,body: body);
    if(response.statusCode == 200){
      var data = json.decode(response.body);
      ShareModel _shareModel = ShareModel.fromJson(data);
      return _shareModel;
    } else {
      print('ERROR '+response.body.toString());
      throw Exception();
    }
  }

  Future<ContactModel> getContactListData() async{
    StorageUtil.getInstance();
    var body =  new Map<String, dynamic>();
    body["user_id"] = StorageUtil.getString('uid') ;
    var response = await http.post(AppStrings.contactListUrl,body: body);
    if(response.statusCode == 200){
      var data = json.decode(response.body);
      ContactModel _shareModel = ContactModel.fromJson(data);
      return _shareModel;
    } else {
      print('ERROR '+response.body.toString());
      throw Exception();
    }
  }

  Future<NotificationModel> getNotificationListData() async{
    StorageUtil.getInstance();
    var body =  new Map<String, dynamic>();
    body["user_id"] = StorageUtil.getString('uid') ;
    var response = await http.post(AppStrings.notificationListUrl,body: body);
    if(response.statusCode == 200){
      var data = json.decode(response.body);
      NotificationModel _shareModel = NotificationModel.fromJson(data);
      return _shareModel;
    } else {
      print('ERROR '+response.body.toString());
      throw Exception();
    }
  }

}