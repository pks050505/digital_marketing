import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  final SharedPreferences preferences;

  OnboardCubit({required this.preferences}) : super(OnboardInitial());
  void firstTimeUser() {
    bool? isFirstTime = preferences.getBool('onBoardScreen');
    if (isFirstTime == true || isFirstTime == null) {
      emit(ShowOnBoardState());
    } else {
      emit(NotShowOnBoardState());
    }
  }
}
