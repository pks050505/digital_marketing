import 'package:digital_marketing/api/cource_repository.dart';
import 'package:digital_marketing/api/instructor_repository.dart';
import 'package:digital_marketing/bloc/allcource/allcource_bloc.dart';
import 'package:digital_marketing/bloc/authentication/authentication_bloc.dart';
import 'package:digital_marketing/bloc/cource/cource_bloc.dart';
import 'package:digital_marketing/bloc/instructor/instructor_bloc.dart';
import 'package:digital_marketing/bloc/onboard/onboard_cubit.dart';
import 'package:digital_marketing/bloc/trendingcource/trendincource_bloc.dart';
import 'package:digital_marketing/bloc_observer.dart';
import 'package:digital_marketing/core/app_router.dart';
import 'package:digital_marketing/demopage.dart';
import 'package:digital_marketing/screen/onboarding/onboard_page.dart';
import 'package:digital_marketing/service/cource_service.dart';
import 'package:digital_marketing/welcomepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'api/auth_repository.dart';
import 'injection_container.dart' as di;

//splace screen animation using rive
bool? seenOnboard;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard') ?? false;
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
    return MultiRepositoryProvider(
      providers: [
        // RepositoryProvider<AuthRepository>(create: (context) => di.sl()),
        // RepositoryProvider<UserRepository>(
        //   create: (context) => di.sl(),
        // ),
        RepositoryProvider<CourceRepository>(
            create: (context) => CourceRepository()),
        RepositoryProvider<InstructorRepository>(
            create: (context) => InstructorRepository()),
        RepositoryProvider<AuthRepository>(
          create: (context) => di.sl(),
        ),
        RepositoryProvider<CourceService>(create: (context) => di.sl())
      ],
      child: MultiBlocProvider(
        providers: [
          // BlocProvider<ThemeCubit>(create: (context) => ThemeCubit()),
          BlocProvider<AllCourceBloc>(
            create: (context) => AllCourceBloc(
              context.read<CourceRepository>(),
            )..add(LoadAllCourceEvent()),
          ),
          BlocProvider<TrendincourceBloc>(
              create: (context) =>
                  TrendincourceBloc(context.read<CourceRepository>())
                    ..add(LoadTendingCourceEvent())),
          BlocProvider<InstructorBloc>(
              create: (context) =>
                  InstructorBloc(context.read<InstructorRepository>())
                    ..add(LoadInstructorEvent())),
          BlocProvider<OnboardCubit>(
            create: (context) => OnboardCubit(preferences: di.sl()),
          ),
          BlocProvider<AuthenticationBloc>(
            create: (context) => AuthenticationBloc(
              authRepository: context.read<AuthRepository>(),
            ),
          ),
          // BlocProvider<InstructorBloc>(create: (context) => di.sl()
          //     //..add(LoadInstructorEvent()),
          //     ),
          BlocProvider<CourceBloc>(
            create: (context) => di.sl()..add(LoadCourceEvent()),
          ),
        ],
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  // final _navigatorKey = GlobalKey<NavigatorState>();

  // NavigatorState get _navigator => _navigatorKey.currentState!;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Digital Marketing App',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.pink,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),

      // darkTheme: ThemeData.dark(),
      home: Scaffold(body: NewCourceTile()),
      //  home: seenOnboard! ? const WelcomePage() : const OnBoardingPage(),
      onGenerateRoute: AppRouter.onGenerateRoute,
    );
  }
}
      // home: BlocBuilder<OnboardCubit, bool>(
      //   builder: (context, state) {
      //     if (state == true) {
      //       return const OnBoardingScreen();
      //     } else {
      //       return const WelcomePage();
      //     }
          // return BlocBuilder<AuthenticationBloc, AuthenticationState>(
          //   builder: (context, state) {
          //     if (state.status == AuthenticationStatus.authenticated) {
          //       return const RootPage();
          //     } else if (state.status == AuthenticationStatus.unauthenticated) {
          //       return LoginPage();
          //     } else if (state.status == AuthenticationStatus.unknown) {
          //       return SplashPage();
          //     }
          //     return SplashPage();
              // switch (state.status) {
              //   case AuthenticationStatus.authenticated:
              //     // Navigator.pushNamedAndRemoveUntil(
              //     //   context,
              //     //   RootPage.routeName,
              //     //   (route) => false,
              //     // );
              //     _navigator.pushAndRemoveUntil<void>(
              //       RootPage.route(),
              //       (route) => false,
              //     );

              //     break;
              //   case AuthenticationStatus.unauthenticated:
              //     _navigator.pushAndRemoveUntil<void>(
              //       LoginPage.route(),
              //       (route) => false,
              //     );

              //     break;
              //   case AuthenticationStatus.unknown:
              //     _navigator.pushAndRemoveUntil<void>(
              //       SplashPage.route(),
              //       (route) => false,
              //     );
              //     break;
              // }
                        // return HomePage();
 
        
     
      // builder: (context, child) {
      //   return BlocListener<AuthenticationBloc, AuthenticationState>(
      //     listener: (context, state) {
      //       switch (state.status) {
      //         case AuthenticationStatus.authenticated:
      //           // Navigator.pushNamedAndRemoveUntil(
      //           //   context,
      //           //   RootPage.routeName,
      //           //   (route) => false,
      //           // );
      //           _navigator.pushAndRemoveUntil<void>(
      //             RootPage.route(),
      //             (route) => false,
      //           );

      //           break;
      //         case AuthenticationStatus.unauthenticated:
      //           _navigator.pushAndRemoveUntil<void>(
      //             LoginPage.route(),
      //             (route) => false,
      //           );

      //           break;
      //         case AuthenticationStatus.unknown:
      //           _navigator.pushAndRemoveUntil<void>(
      //             SplashPage.route(),
      //             (route) => false,
      //           );
      //           break;
      //       }
      //     },
      //     child: child,
      //   );
      // },
    
