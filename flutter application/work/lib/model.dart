class Model {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  int? iV;

  Model(
      {this.sId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.iV});

  Model.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['password'] = this.password;
    data['__v'] = this.iV;
    return data;
  }
}