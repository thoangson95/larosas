class UserModel {
  int? id;
  int? idSocial;
  String? username;
  String? password;
  String? confirmCode;
  String? avatar;
  String? fullname;
  int? phone;
  String? email;
  String? address;
  int? gender;
  String? loginSession;
  String? lastlogin;
  String? status;
  int? birthday;
  int? numb;

  UserModel(Future<UserModel> Function(dynamic ref) param0, 
      {this.id,
      this.idSocial,
      this.username,
      this.password,
      this.confirmCode,
      this.avatar,
      this.fullname,
      this.phone,
      this.email,
      this.address,
      this.gender,
      this.loginSession,
      this.lastlogin,
      this.status,
      this.birthday,
      this.numb});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idSocial = json['id_social'];
    username = json['username'];
    password = json['password'];
    confirmCode = json['confirm_code'];
    avatar = json['avatar'];
    fullname = json['fullname'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    gender = json['gender'];
    loginSession = json['login_session'];
    lastlogin = json['lastlogin'];
    status = json['status'];
    birthday = json['birthday'];
    numb = json['numb'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['id_social'] = idSocial;
    data['username'] = username;
    data['password'] = password;
    data['confirm_code'] = confirmCode;
    data['avatar'] = avatar;
    data['fullname'] = fullname;
    data['phone'] = phone;
    data['email'] = email;
    data['address'] = address;
    data['gender'] = gender;
    data['login_session'] = loginSession;
    data['lastlogin'] = lastlogin;
    data['status'] = status;
    data['birthday'] = birthday;
    data['numb'] = numb;
    return data;
  }
}