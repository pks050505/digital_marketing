part of 'allcource_bloc.dart';

abstract class AllCourceEvent extends Equatable {
  const AllCourceEvent();

  @override
  List<Object> get props => [];
}

class LoadAllCourceEvent extends AllCourceEvent {}
