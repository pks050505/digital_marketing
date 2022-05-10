import 'dart:async';

import 'package:digital_marketing/api/api.dart';

import '../dao/user_model.dart';

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthRepository extends BaseApi {
  final _controller = StreamController<AuthenticationStatus>();
  AuthRepository();
  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.unknown;
    await Future<void>.delayed(const Duration(seconds: 1));

    await Future<void>.delayed(const Duration(seconds: 1));
    yield AuthenticationStatus.unauthenticated;
    yield* _controller.stream;
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    await Future.delayed(
      const Duration(seconds: 2),
      () => _controller.add(AuthenticationStatus.authenticated),
    );
  }

  @override
  Future<UserModel?> getUser() async {
    try {
      return Future.value(
        UserModel(
          address: 'Delhi',
          email: 'frombloc@gmail.com',
          image: "https://randomuser.me/api/portraits/men/47.jpg",
          name: 'unnamed user',
          packageType: 'elite package',
          phoneNo: '1234567890',
          userId: 'userId',
        ),
      );
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> logOut() async {
    _controller.add(AuthenticationStatus.unauthenticated);
  }

  void dispose() => _controller.close();
}
