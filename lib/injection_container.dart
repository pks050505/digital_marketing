import 'package:digital_marketing/bloc/authentication/authentication_bloc.dart';
import 'package:digital_marketing/bloc/cubit/onboard_cubit.dart';
import 'package:digital_marketing/bloc/login/login_bloc.dart';
import 'package:digital_marketing/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  sl.registerFactory<OnboardCubit>(() => OnboardCubit());
  sl.registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(authRepository: sl()));
  sl.registerFactory<LoginBloc>(() => LoginBloc(authRepo: sl()));
  //repository
  sl.registerLazySingleton<AuthRepository>(() => AuthRepository());
  // External

  final preference = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => preference);
}
