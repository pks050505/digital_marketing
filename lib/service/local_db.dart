import 'dart:math';

import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalDatabase {
  bool? isFirstTimeOpened();
}

class LocalDatabaseImpl implements LocalDatabase {
  final SharedPreferences preferences;
  LocalDatabaseImpl(this.preferences);

  @override
  bool? isFirstTimeOpened() {
    throw UnimplementedError();
  }
}
