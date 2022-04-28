// import 'package:digital_marketing/bloc/login/login_bloc.dart';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:url_launcher/url_launcher.dart';

// class LoginScreen extends StatelessWidget {
//   static const String routeName = '/login_screen';
//   static Route route() {
//     return MaterialPageRoute(
//       settings: const RouteSettings(name: routeName),
//       builder: (_) => LoginScreen(),
//     );
//   }

//   LoginScreen({Key? key}) : super(key: key);
//   final _formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<LoginBloc, LoginState>(
//       listener: (context, state) {
//         final formStatus = state.status;
//         if (formStatus is FormSubmissionFailed) {
//           _showSnackBar(context, formStatus.exception.toString());
//         } else if (formStatus is FormSubmissionSuccess) {
//           _showSnackBar(context, 'Logged In');
//         }
//       },
//       child: Scaffold(
//         body: Center(
//           child: Form(
//             key: _formKey,
//             child: ListView(
//               physics: const BouncingScrollPhysics(),
//               shrinkWrap: true,
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               children: [
//                 Text(
//                   'Login',
//                   style: Theme.of(context).textTheme.headline2,
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 100),
//                 BlocBuilder<LoginBloc, LoginState>(
//                   buildWhen: ((previous, current) =>
//                       previous.email != current.email),
//                   builder: (context, state) {
//                     return TextFormField(
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.email),
//                         hintText: 'abc@gmail.com',
//                         errorText: 'Invalid Email !',
//                         label: Text(
//                           'Email',
//                         ),
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) =>
//                           state.isValidEmail ? null : 'Invalid Email',
//                       keyboardType: TextInputType.emailAddress,
//                       onChanged: (email) {
//                         context.read<LoginBloc>().add(LoginEmailChanged(email));
//                       },
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 10),
//                 BlocBuilder<LoginBloc, LoginState>(
//                   buildWhen: ((previous, current) =>
//                       previous.password != current.password),
//                   builder: (context, state) {
//                     return TextFormField(
//                       obscureText: true,
//                       decoration: const InputDecoration(
//                         icon: Icon(Icons.password),
//                         hintText: 'Enter Your Password',
//                         // errorText: 'Password Not valid !',
//                         label: Text('Password'),
//                         border: OutlineInputBorder(),
//                       ),
//                       validator: (value) => state.isValidPassword
//                           ? null
//                           : 'Password is too short',
//                       onChanged: (password) {
//                         context
//                             .read<LoginBloc>()
//                             .add(LoginPasswordChanged(password));
//                       },
//                     );
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 BlocBuilder<LoginBloc, LoginState>(
//                   builder: (context, state) {
//                     return state.status is FormSubmitting
//                         ? const CircularProgressIndicator()
//                         : ElevatedButton(
//                             onPressed: () {
//                               if (_formKey.currentState!.validate()) {
//                                 // context
//                                 //     .read<LoginBloc>()
//                                 //     .add(LoginFormSubmittedEvent());
//                               }

//                               // Navigator.pushNamed(context, RootPage.routeName);
//                               // Navigator.pushReplacementNamed(context, RootPage.routeName);
//                             },
//                             child: const Text('Login'),
//                           );
//                   },
//                 ),
//                 ElevatedButton(
//                   onPressed: () async {
//                     const String url = "https://www.idigitalpreneur.com/login";

//                     if (await canLaunch(url)) {
//                       launch(url);
//                     }
//                   },
//                   child: const Text('Create account'),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _showSnackBar(BuildContext context, String message) {
//     ScaffoldMessenger.of(context)
//       ..hideCurrentSnackBar()
//       ..showSnackBar(SnackBar(content: Text(message)));
//   }
// }
