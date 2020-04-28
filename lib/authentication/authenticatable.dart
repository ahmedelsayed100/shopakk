import 'package:shopak/user/user.dart';

class Authenticatable {
  Future<User> register(String email, String password) {}
  Future<bool> login(String email, String password) {}
  Future<bool> restPassword(String email) {}
  Future<User> profile(String email) {}
}
