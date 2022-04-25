import 'package:digital_marketing/dao/models.dart';

class AuthRepository {
  Stream<UserModel> get user {
    return Stream.fromFuture(Future.delayed(Duration(seconds: 5)));
  }

  Future<void> login(String email, String password) async {
    print('attempting login');
    Future.delayed(Duration(seconds: 3));
    print('logged In');
  }

  Future<bool> isAuthenticated() {
    return Future.value(false);
  }

  Future<bool> logOut() {
    return Future.value(true);
  }
}
