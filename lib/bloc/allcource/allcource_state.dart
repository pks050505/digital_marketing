part of 'allcource_bloc.dart';

abstract class AllCourceState extends Equatable {
  const AllCourceState();

  @override
  List<Object> get props => [];
}

class AllCourceLoading extends AllCourceState {}

class AllCourceLoaded extends AllCourceState {
  final List<CourceModel> cources;
  const AllCourceLoaded(this.cources);
  @override
  List<Object> get props => [cources];
}

class AllCourceError extends AllCourceState {
  final String message;
  const AllCourceError(this.message);
  @override
  List<Object> get props => [message];
}
