import 'package:digital_marketing/bloc/cource/cource_bloc.dart';
import 'package:digital_marketing/bloc/instructor/instructor_bloc.dart';
import 'package:digital_marketing/bloc/onboard/onboard_cubit.dart';
import 'package:digital_marketing/repository/user_repository.dart';
import 'package:digital_marketing/service/cource_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/login/login_bloc.dart';
import 'repository/authentication_repository.dart';

final sl = GetIt.instance;
//This is dependency injection  page which is use for populate the data between entire screen.
//Term
//BlocProvider
//BlocMultiProvider
//BlocBuilder
//BlocConsumer
//and some more
Future<void> init() async {
  //bloc
  // sl.registerFactory<OnboardCubit>(() => OnboardCubit());

  sl.registerFactory<AuthenticationBloc>(() =>
      AuthenticationBloc(authenticationRepository: sl(), userRepository: sl()));
  sl.registerFactory<LoginBloc>(
      () => LoginBloc(authenticationRepository: sl()));
  sl.registerFactory<OnboardCubit>(() => OnboardCubit(
        preferences: sl(),
      ));
  sl.registerFactory<InstructorBloc>(() => InstructorBloc(sl()));
  sl.registerFactory<CourceBloc>(() => CourceBloc(sl()));
  //repository
  sl.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository());
  sl.registerLazySingleton<UserRepository>(() => UserRepository());
  sl.registerLazySingleton<CourceService>(() => CourceServiceImpl());

  // External

  final preference = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => preference);
}
