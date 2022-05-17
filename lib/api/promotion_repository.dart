import 'package:digital_marketing/api/base_api.dart';

import '../dao/promotion_model.dart';

class PromotionRepository extends BaseApi {
  @override
  Future<List<PromotionModel>?> promotionalPost() async {
    try {
      return null;
    } catch (e) {
      throw Exception();
    }
  }
}
