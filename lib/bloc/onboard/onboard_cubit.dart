import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'onboard_state.dart';

//if onboard is false then not show
class OnboardCubit extends Cubit<bool> {
  final SharedPreferences preferences;
  OnboardCubit({required this.preferences}) : super(true);
  void showOnboard() {
    int? onboard = preferences.getInt('onboard');
    emit(onboard == null || onboard == 0 ? false : true);
  }

  void setOnboardfalse() {
    preferences.setInt('onboard', 1);
  }
}
