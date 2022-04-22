import 'package:digital_marketing/bloc/cubit/onboard_cubit.dart';
import 'package:digital_marketing/bloc_observer.dart';
import 'package:digital_marketing/core/app_router.dart';
import 'package:digital_marketing/injection_container.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;
import 'screen/authentication/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  BlocOverrides.runZoned(
    () => runApp(const MyApp()),
    blocObserver: AppBlocObserver(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // BlocProvider<OnboardCubit>(create: ((context) {
        //   return OnboardCubit(preferences: sl())..firstTimeUser();
        // })),
        BlocProvider<OnboardCubit>(create: (_) => sl())
      ],
      child: MaterialApp(
        title: 'Digital Marketing',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.pink),

        // initialRoute: ProfilePage.routeName,
        initialRoute: LoginScreen.routeName,
        // // initialRoute: WelcomePageForLoginAndHome.routeName,
        // onGenerateRoute: AppRouter.onGenerateRoute,
        onGenerateRoute: AppRouter.onGenerateRoute,
      ),
    );
  }
}
