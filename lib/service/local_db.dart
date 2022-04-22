import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDatabase {
  bool isFirstTimeOpened();
}

class LocalDatabaseImpl implements LocalDatabase {
  @override
  bool isFirstTimeOpened() {
    return Random().nextBool();
  }
}
