class LoginModel {
  String status;
  String message;
  UserProfile userProfile;

  LoginModel({this.status, this.message, this.userProfile});

  LoginModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userProfile = json['user_profile'] != null
        ? new UserProfile.fromJson(json['user_profile'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.userProfile != null) {
      data['user_profile'] = this.userProfile.toJson();
    }
    return data;
  }
}

class UserProfile {
  String userId;
  Null companyId;
  Null userType;
  String photo;
  String firstName;
  String lastName;
  String userEmail;
  String password;
  String designation;
  String department;
  String mobile;
  String phoneNumber1;
  String phoneNumber2;
  Null office;

  UserProfile(
      {this.userId,
        this.companyId,
        this.userType,
        this.photo,
        this.firstName,
        this.lastName,
        this.userEmail,
        this.password,
        this.designation,
        this.department,
        this.mobile,
        this.phoneNumber1,
        this.phoneNumber2,
        this.office});

  UserProfile.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    companyId = json['company_id'];
    userType = json['user_type'];
    photo = json['photo'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userEmail = json['user_email'];
    password = json['password'];
    designation = json['designation'];
    department = json['department'];
    mobile = json['mobile'];
    phoneNumber1 = json['phone_number1'];
    phoneNumber2 = json['phone_number2'];
    office = json['office'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['company_id'] = this.companyId;
    data['user_type'] = this.userType;
    data['photo'] = this.photo;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_email'] = this.userEmail;
    data['password'] = this.password;
    data['designation'] = this.designation;
    data['department'] = this.department;
    data['mobile'] = this.mobile;
    data['phone_number1'] = this.phoneNumber1;
    data['phone_number2'] = this.phoneNumber2;
    data['office'] = this.office;
    return data;
  }
}