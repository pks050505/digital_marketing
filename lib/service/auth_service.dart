import 'dart:math';

import 'package:digital_marketing/dao/models.dart';
import 'package:digital_marketing/screen/onboarding/onboarding_screen.dart';

abstract class AuthService {
  bool isAuthenticated();
  Future<UserModel> signIn(String email, String password);
}

class AuthServiceImpl implements AuthService {
  @override
  bool isAuthenticated() {
    // return Random().nextBool();
    return false;
  }

  @override
  Future<UserModel> signIn(String email, String password) async {
    try {
      return await Future.value(
        UserModel(
          address: 'pks050505@gmail.com',
          image: imageUrll,
          name: 'Purushottam',
          phoneNo: '1234567890',
        ),
      );
    } catch (e) {
      throw Exception();
    }
  }
}
