import 'package:digital_marketing/bloc/cubit/onboard_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //bloc
  sl.registerFactory<OnboardCubit>(() => OnboardCubit(preferences: sl()));
  //External
  final preference = await SharedPreferences.getInstance();
  sl.registerLazySingleton<SharedPreferences>(() => preference);
}
