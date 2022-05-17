import 'dart:async';
import 'dart:convert';

import '../dao/user_model.dart';
import 'base_api.dart';
import 'package:http/http.dart' as http;

enum AuthenticationStatus { unknown, authenticated, unauthenticated }
const authUrl = "https://www.idigitalpreneur.com/api/login";

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
  Future<String> signIn(
      {required String email, required String password}) async {
    final responce = await http.post(Uri.parse(authUrl), body: {
      "email": email,
      "password": password
    }, headers: {
      "Accept": "application/json",
      "Content-Type": "Application/x-www-form-urlencoded",
    });

    if (responce.statusCode == 200) {
      Map output = jsonDecode(responce.body);
      if (output['error'] == 404 || output['error'] == 204) {
        return output['message'];
      } else {
        return output['message'];
      }
    } else {
      return 'server Error';
    }
    // await Future.delayed(
    //   const Duration(seconds: 2),
    //   () => _controller.add(AuthenticationStatus.authenticated),
    // );
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
