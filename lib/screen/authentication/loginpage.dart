import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../api/auth_repository.dart';
import '../../bloc/login/login_bloc.dart';

class LoginPage extends StatelessWidget {
  static const String routeName = 'login';
  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: ((context) {
        return LoginPage();
      }),
    );
  }
  // static Route route() {
  //   return MaterialPageRoute<void>(builder: (_) => LoginPage());
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocProvider(
          create: (context) {
            return LoginBloc(
              authRepository: RepositoryProvider.of<AuthRepository>(context),
            );
          },
          child: LoginForm(),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.status.isSubmissionFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asserts/images/idplogo.png',
              color: Colors.redAccent.shade400,
              fit: BoxFit.cover,
              height: 250,
            ),
            _UsernameInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _PasswordInput(),
            const Padding(padding: EdgeInsets.all(12)),
            _LoginButton(),
            ElevatedButton(
              onPressed: () async {
                const String url =
                    "https://www.idigitalpreneur.com/buy-package";

                if (await canLaunch(url)) {
                  launch(url);
                }
              },
              child: const Text('Create account'),
            ),
          ],
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) =>
              context.read<LoginBloc>().add(LoginUsernameChanged(username)),
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.email),
            labelText: 'username',
            // errorText: state.username.invalid ? 'invalid username' : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: ((previous, current) => previous.password != current.password),
      builder: (context, state) {
        return TextFormField(
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: const Icon(Icons.password),
            hintText: 'password',
            label: Text(
              'Password',
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          validator: (value) =>
              state.password.invalid ? 'Invalid Password' : null,
          keyboardType: TextInputType.emailAddress,
          onChanged: (password) {
            context.read<LoginBloc>().add(LoginPasswordChanged(password));
          },
        );
      },
    );
    // return BlocBuilder<LoginBloc, LoginState>(
    //   buildWhen: (previous, current) => previous.password != current.password,
    //   builder: (context, state) {
    //     return TextField(
    //       key: const Key('loginForm_passwordInput_textField'),
    //       onChanged: (password) =>
    //           context.read<LoginBloc>().add(LoginPasswordChanged(password)),
    //       obscureText: true,
    //       decoration: InputDecoration(
    //         labelText: 'password',
    //         errorText: state.password.invalid ? 'invalid password' : null,
    //         border: const OutlineInputBorder(),
    //       ),
    //     );
    //   },
    // );
  }
}

class _LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return state.status.isSubmissionInProgress
            ? const CircularProgressIndicator()
            : ElevatedButton(
                key: const Key('loginForm_continue_raisedButton'),
                child: const Text('Login'),
                onPressed: state.status.isValidated
                    ? () {
                        context.read<LoginBloc>().add(const LoginSubmitted());
                      }
                    : null,
              );
      },
    );
  }
}
