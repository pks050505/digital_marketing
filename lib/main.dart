import 'package:digital_marketing/bloc/authentication/authentication_bloc.dart';
import 'package:digital_marketing/bloc/cubit/onboard_cubit.dart';
import 'package:digital_marketing/bloc/login/login_bloc.dart';
import 'package:digital_marketing/bloc_observer.dart';
import 'package:digital_marketing/core/app_router.dart';
import 'package:digital_marketing/injection_container.dart';
import 'package:digital_marketing/repository/auth_repository.dart';
import 'package:digital_marketing/screen/authentication/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'injection_container.dart' as di;

void main() async {
  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  HydratedBlocOverrides.runZoned(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await di.init();
      runApp(const MyApp());
    },
    blocObserver: AppBlocObserver(),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (_) => sl()),
      ],
      child: MultiBlocProvider(
        providers: [
          // BlocProvider<OnboardCubit>(create: ((context) {
          //   return OnboardCubit(preferences: sl())..firstTimeUser();
          // })),
          // need to implement
          // BlocProvider<AuthenticationBloc>(create: (_) => sl()),
          BlocProvider<AuthenticationBloc>(create: (_) => sl()),
          BlocProvider<LoginBloc>(create: (_) => sl()),
          BlocProvider<OnboardCubit>(create: (_) => sl())
        ],
        child: BlocBuilder<OnboardCubit, bool>(
          //need to implement Authentication Bloc in Welcome Screen
          builder: (context, onboard) {
            return MaterialApp(
              title: 'Digital Marketing App',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(primarySwatch: Colors.pink),

              // initialRoute:
              //     onboard ? OnBoardingScreen.routeName : WelcomeScreen.routeName,
              initialRoute: LoginScreen.routeName,
              onGenerateRoute: AppRouter.onGenerateRoute,
            );
          },
        ),
      ),
    );
  }
}
