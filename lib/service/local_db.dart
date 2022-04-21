import 'dart:math';

abstract class LocalDatabase {
  bool isFirstTimeOpened();
}

class LocalDatabaseImpl implements LocalDatabase {
  @override
  bool isFirstTimeOpened() {
    return Random().nextBool();
  }
}
