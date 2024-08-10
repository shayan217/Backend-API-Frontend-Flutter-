class Model {
  String? sId;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  int? iV;

  Model({
    this.sId,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.iV,
  });

  Model.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    password = json['password'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': sId,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      '__v': iV,
    };
  }
}
