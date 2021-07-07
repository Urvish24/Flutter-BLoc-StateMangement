class NotificationModel {
  String status;
  List<NotificationList> notificationList;

  NotificationModel({this.status, this.notificationList});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['notification_list'] != null) {
      notificationList = new List<NotificationList>();
      json['notification_list'].forEach((v) {
        notificationList.add(new NotificationList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.notificationList != null) {
      data['notification_list'] =
          this.notificationList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NotificationList {
  String notificationId;
  String userId;
  String contactId;
  String message;
  String isRead;
  String messageType;
  String url;
  String createdDate;

  NotificationList(
      {this.notificationId,
        this.userId,
        this.contactId,
        this.message,
        this.isRead,
        this.messageType,
        this.url,
        this.createdDate});

  NotificationList.fromJson(Map<String, dynamic> json) {
    notificationId = json['notification_id'];
    userId = json['user_id'];
    contactId = json['contact_id'];
    message = json['message'];
    isRead = json['is_read'];
    messageType = json['message_type'];
    url = json['url'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notification_id'] = this.notificationId;
    data['user_id'] = this.userId;
    data['contact_id'] = this.contactId;
    data['message'] = this.message;
    data['is_read'] = this.isRead;
    data['message_type'] = this.messageType;
    data['url'] = this.url;
    data['created_date'] = this.createdDate;
    return data;
  }
}