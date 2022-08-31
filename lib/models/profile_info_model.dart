class ProfileInfoModel {
  String? userId;
  String? loginEmail;
  String? loginMobile;
  String? slug;
  String? status;
  String? firstName;
  String? lastName;
  String? idNumber;
  String? idType;
  String? address;
  String? countryId;
  String? city;
  String? zipCode;

  ProfileInfoModel(
      {this.userId,
        this.loginEmail,
        this.loginMobile,
        this.slug,
        this.status,
        this.firstName,
        this.lastName,
        this.idNumber,
        this.idType,
        this.address,
        this.countryId,
        this.city,
        this.zipCode});

  ProfileInfoModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    loginEmail = json['login_email'];
    loginMobile = json['login_mobile'];
    slug = json['slug'];
    status = json['status'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    idNumber = json['id_number'];
    idType = json['id_type'];
    address = json['address'];
    countryId = json['country_id'];
    city = json['city'];
    zipCode = json['zip_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['login_email'] = this.loginEmail;
    data['login_mobile'] = this.loginMobile;
    data['slug'] = this.slug;
    data['status'] = this.status;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['id_number'] = this.idNumber;
    data['id_type'] = this.idType;
    data['address'] = this.address;
    data['country_id'] = this.countryId;
    data['city'] = this.city;
    data['zip_code'] = this.zipCode;
    return data;
  }
}