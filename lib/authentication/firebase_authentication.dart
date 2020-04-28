import 'package:shopak/authentication/authenticatable.dart';
import 'package:shopak/user/user.dart';

class FireBaseAuthentication implements Authenticatable {
  @override
  Future<bool> login(String email, String password) {
    // TODO: implement login
    return null;
  }

  @override
  Future<User> register(String email, String password) {
    // TODO: implement register
    return null;
  }

  @override
  Future<bool> restPassword(String email) {
    // TODO: implement restPassword
    return null;
  }

  @override
  Future<User> profile(String email) {
    // TODO: implement profile
    return null;
  }
}
