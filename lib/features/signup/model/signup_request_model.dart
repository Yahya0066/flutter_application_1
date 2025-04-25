class SignRequestModel {
  final String email;
  final String name;
  final String phone;
  final String uid;
  SignRequestModel({
    required this.email,
    required this.name,
    required this.phone,
    required this.uid,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['phone'] = phone;
    data['uid'] = uid;
    return data;
  }
}
