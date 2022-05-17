import 'package:bloc/bloc.dart';
import 'package:digital_marketing/dao/models.dart';
import 'package:equatable/equatable.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  void getUser(UserModel user) {
    emit(UserLoaded(user));
  }
}
