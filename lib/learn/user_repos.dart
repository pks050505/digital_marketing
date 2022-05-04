import 'dart:async';

import 'package:digital_marketing/learn/bloc/auth_bloc/auth_state.dart';

abstract class BaseUserRepos {
  Future<void> signIn(String email, String password) async {}
  Future<void> signUp(String email, String password, String name) async {}
  Future<void> signOut() async {}
  Future<bool?> isSignedIn() async {}
  Future<User?> getUser() async {}
}

class UserRepos extends BaseUserRepos {
  @override
  Future<void> signIn(String email, String password) {
    return super.signIn(email, password);
  }

  @override
  Future<void> signUp(String email, String password, String name) async {
    return super.signUp(email, password, name);
  }

  @override
  Future<void> signOut() {
    return super.signOut();
  }

  Future<bool> isSignedIn() {
    return Future.value(true);
  }

  Future<User> getUser() {
    return Future.value(User());
  }
}
