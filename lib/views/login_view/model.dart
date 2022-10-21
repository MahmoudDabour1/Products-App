class UserData {
  late final bool status;
  late final String msg;
  late final Data data;

  UserData.fromJson(Map<String, dynamic> json) {
    status = json['status'] ?? false;
    msg = json['msg'] ?? "";
    data = Data.fromJson(json['data']);
  }
}

class Data {
  late final UserDetails userDetails;

  Data.fromJson(Map<String, dynamic> json) {
    userDetails = UserDetails.fromJson(json['userDetails']);
  }
}

class UserDetails {
  late final int id;
  late final String name;
  late final String phone;
  late final String status;
  late final String email;
  late final String image;
  late final String rememberToken;

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    phone = json['phone'] ?? "";
    status = json['status'] ?? "";
    email = json['email'] ?? "";
    image = json['image'] ?? "";
    rememberToken = json['remember_token'] ?? "";
  }
}

class Data2 {
  bool? Status;
  String? MSG;

  Data2.fromJson(Map<String, dynamic> json) {
    Status = json['status'];
    MSG = json['msg'];
  }
}
