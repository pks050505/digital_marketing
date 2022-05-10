import 'package:digital_marketing/api/api.dart';
import 'package:digital_marketing/bloc/cource/cource_bloc.dart';
import 'package:digital_marketing/bloc/instructor/instructor_bloc.dart';
import 'package:digital_marketing/bloc/onboard/onboard_cubit.dart';

import 'package:digital_marketing/service/cource_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'api/auth_repository.dart';
import 'bloc/authentication/authentication_bloc.dart';
import 'bloc/login/login_bloc.dart';

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

  sl.registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(authRepository: sl()));
  sl.registerFactory<LoginBloc>(() => LoginBloc(authRepository: sl()));
  sl.registerFactory<OnboardCubit>(() => OnboardCubit(
        preferences: sl(),
      ));
  sl.registerFactory<InstructorBloc>(() => InstructorBloc(sl()));
  sl.registerFactory<CourceBloc>(() => CourceBloc(sl()));
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository());
  //repository
  // sl.registerLazySingleton<AuthRepository>(() => AuthRepository());
  // sl.registerLazySingleton<UserRepository>(() => UserRepository());
  sl.registerLazySingleton<CourceService>(() => CourceServiceImpl());

  // External

  final preference = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => preference);
}
