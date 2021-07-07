class DeskModel {
  String status;
  CardDetail cardDetail;
  String shareCount;
  String viewCount;
  String contactCount;
  String selectedTamplet;

  DeskModel(
      {this.status,
        this.cardDetail,
        this.shareCount,
        this.viewCount,
        this.contactCount,
        this.selectedTamplet});

  DeskModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    cardDetail = json['card_detail'] != null
        ? new CardDetail.fromJson(json['card_detail'])
        : null;
    shareCount = json['share_count'];
    viewCount = json['view_count'];
    contactCount = json['contact_count'];
    selectedTamplet = json['selected_tamplet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.cardDetail != null) {
      data['card_detail'] = this.cardDetail.toJson();
    }
    data['share_count'] = this.shareCount;
    data['view_count'] = this.viewCount;
    data['contact_count'] = this.contactCount;
    data['selected_tamplet'] = this.selectedTamplet;
    return data;
  }
}

class CardDetail {
  String firstName;
  String lastName;
  String mobile;
  String phoneNumber1;
  String phoneNumber2;
  String userEmail;
  String companyPhone1;
  String companyPhone2;
  String companyAddress;
  String instagramId;
  String linkedinId;
  String facebookId;
  String photo;
  String companyLogo;
  String company;
  String designation;
  String department;
  String twitterId;
  String country;
  String state;
  String city;
  String zipcode;
  String specificSocialId;
  String providerType;
  String companyWebsite;
  String latitude;
  String longitude;

  CardDetail(
      {this.firstName,
        this.lastName,
        this.mobile,
        this.phoneNumber1,
        this.phoneNumber2,
        this.userEmail,
        this.companyPhone1,
        this.companyPhone2,
        this.companyAddress,
        this.instagramId,
        this.linkedinId,
        this.facebookId,
        this.photo,
        this.companyLogo,
        this.company,
        this.designation,
        this.department,
        this.twitterId,
        this.country,
        this.state,
        this.city,
        this.zipcode,
        this.specificSocialId,
        this.providerType,
        this.companyWebsite,
        this.latitude,
        this.longitude});

  CardDetail.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    mobile = json['mobile'];
    phoneNumber1 = json['phone_number1'];
    phoneNumber2 = json['phone_number2'];
    userEmail = json['user_email'];
    companyPhone1 = json['company_phone1'];
    companyPhone2 = json['company_phone2'];
    companyAddress = json['company_address'];
    instagramId = json['instagram_id'];
    linkedinId = json['linkedin_id'];
    facebookId = json['facebook_id'];
    photo = json['photo'];
    companyLogo = json['company_logo'];
    company = json['company'];
    designation = json['designation'];
    department = json['department'];
    twitterId = json['twitter_id'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    zipcode = json['zipcode'];
    specificSocialId = json['specific_social_id'];
    providerType = json['provider_type'];
    companyWebsite = json['company_website'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['mobile'] = this.mobile;
    data['phone_number1'] = this.phoneNumber1;
    data['phone_number2'] = this.phoneNumber2;
    data['user_email'] = this.userEmail;
    data['company_phone1'] = this.companyPhone1;
    data['company_phone2'] = this.companyPhone2;
    data['company_address'] = this.companyAddress;
    data['instagram_id'] = this.instagramId;
    data['linkedin_id'] = this.linkedinId;
    data['facebook_id'] = this.facebookId;
    data['photo'] = this.photo;
    data['company_logo'] = this.companyLogo;
    data['company'] = this.company;
    data['designation'] = this.designation;
    data['department'] = this.department;
    data['twitter_id'] = this.twitterId;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['zipcode'] = this.zipcode;
    data['specific_social_id'] = this.specificSocialId;
    data['provider_type'] = this.providerType;
    data['company_website'] = this.companyWebsite;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    return data;
  }
}