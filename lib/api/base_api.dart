import 'dart:async';

import 'package:digital_marketing/dao/models.dart';
import 'package:digital_marketing/dao/promotion_model.dart';

abstract class BaseApi {
  Future<String> signIn(
      {required String email, required String password}) async {
    return '';
  }

  Future<void> logOut() async {}
  Future<UserModel?> getUser() async {}
  Future<List<CourceModel>?> getAllCources() async {}
  Future<List<CourceModel>?> trandingCources() async {}
  Future<List<InstructorModel>?> getAllInstructors() async {}
  Future<List<CourceModel>?> userPurchasedCourses(String uid) async {}
  Future<List<PromotionModel>?> promotionalPost() async {}
}
