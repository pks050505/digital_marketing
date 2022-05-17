part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoaded extends UserState {
  final UserModel user;
  UserLoaded(this.user);
  @override
  List<Object> get props => [user];
}