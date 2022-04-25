import 'package:hydrated_bloc/hydrated_bloc.dart';

// if state is false=> then Onboard screen will not show
//if state is true => then onBoardScreen will show
class OnboardCubit extends HydratedCubit<bool> {
  OnboardCubit() : super(true);
  void changeOnboardState() => emit(false);

  @override
  bool? fromJson(Map<String, dynamic> json) => json['onboard'] as bool;

  @override
  Map<String, dynamic>? toJson(bool state) => {'onboard': state};

  // @override
  // int fromJson(Map<String, dynamic> json) => json['value'] as int;

  // @override
  // Map<String, int> toJson(int state) => { 'value': state };

}
