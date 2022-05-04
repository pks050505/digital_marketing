import 'package:digital_marketing/dao/models.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

abstract class BaseAuthRepository {
  Future<UserModel?> login(String email, String password) async {}
}

class AuthRepository extends BaseAuthRepository {
  var url = 'api url';
  @override
  Future<UserModel?> login(String email, String password) async {
    try {
      var responce = await http.get(Uri.parse(url));
      var json = responce.body;
    } catch (e) {
      throw Exception('Authentication Error');
    }
    // return super.login(email, password);
  }
}
