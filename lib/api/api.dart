import 'dart:async';

import 'package:digital_marketing/dao/models.dart';

abstract class BaseApi {
  Future<void> signIn(
      {required String email, required String password}) async {}
  Future<void> logOut() async {}
  Future<UserModel?> getUser() async {}
  Future<List<CourceModel>?> getAllCources() async {}
  Future<List<CourceModel>?> trandingCources() async {}
  Future<List<InstructorModel>?> getAllInstructors() async {}
  Future<List<CourceModel>?> userPurchasedCourses(String uid) async {}
}

class CourcesRepository extends BaseApi {
  @override
  Future<List<CourceModel>?> getAllCources() async {}
  @override
  Future<List<CourceModel>?> trandingCources() async {}

  @override
  Future<List<CourceModel>?> userPurchasedCourses(String uid) async {}
}

class InstructorRepository extends BaseApi {
  @override
  Future<List<InstructorModel>?> getAllInstructors() async {}
}
