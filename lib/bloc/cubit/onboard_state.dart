part of 'onboard_cubit.dart';

abstract class OnboardState extends Equatable {
  const OnboardState();

  @override
  List<Object> get props => [];
}

class OnboardInitial extends OnboardState {}

class ShowOnBoardState extends OnboardState {}

class NotShowOnBoardState extends OnboardState {}
