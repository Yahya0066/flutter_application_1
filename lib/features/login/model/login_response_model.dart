class LoginResponseModel {
  final String token;
  final String? error;
  final dynamic user;

  LoginResponseModel({
    required this.token,
    this.error,
    this.user,
    required uid,
    required phone,
    required name,
    required email,
    required String username,
  });

  get email => null;

  get password => null;

  get phone => null;

  get username => null;

  get uid => null;

  static LoginResponseModel formJson(Map<String, dynamic>? userData) {
    if (userData == null || !userData.containsKey('token')) {
      throw ArgumentError('Invalid user data');
    }
    return LoginResponseModel(
      token: userData['token'],
      error: userData['error'],
      user: userData['user'],
      uid: userData['uid'],
      phone: userData['phone'],
      name: userData['name'],
      email: userData['email'],
      username: userData['username'],
    );
  }
}
