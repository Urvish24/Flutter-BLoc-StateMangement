class ContactModel {
  String status;
  List<ContactList> contactList;

  ContactModel({this.status, this.contactList});

  ContactModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['contact_list'] != null) {
      contactList = new List<ContactList>();
      json['contact_list'].forEach((v) {
        contactList.add(new ContactList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.contactList != null) {
      data['contact_list'] = this.contactList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContactList {
  String contactsId;
  String name;
  String designation;
  bool tap;

  ContactList({this.contactsId, this.name, this.designation});

  ContactList.fromJson(Map<String, dynamic> json) {
    contactsId = json['contacts_id'];
    name = json['name'];
    designation = json['designation'];
    tap = false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contacts_id'] = this.contactsId;
    data['name'] = this.name;
    data['designation'] = this.designation;
    data['tap'] = this.tap;
    return data;
  }
}