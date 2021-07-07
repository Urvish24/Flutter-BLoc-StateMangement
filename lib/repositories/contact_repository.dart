

 import 'package:contactapp/datasource/contact_data_source.dart';
import 'package:contactapp/models/conlist_model.dart';
import 'package:contactapp/models/deskboard_model.dart';
import 'package:contactapp/models/login_model.dart';
import 'package:contactapp/models/notification_model.dart';
import 'package:contactapp/models/share_model.dart';

class ContactRepository {

  ContactDataSource _contactDataSource;

  ContactRepository(this._contactDataSource);

  Future<LoginModel> fetchLoginData(var body) async {
   return await _contactDataSource.postLogin(body);
  }

  Future<DeskModel> fetchDeskBoardData() async {
    return await _contactDataSource.getDesk();
  }


  Future<ShareModel> shareNumberData(var body) async {
    return await _contactDataSource.postNumberData(body);
  }

  Future<ContactModel> fetchContactListData() async {
    return await _contactDataSource.getContactListData();
  }

  Future<NotificationModel> fetchNotificationListData() async {
    return await _contactDataSource.getNotificationListData();
  }

}