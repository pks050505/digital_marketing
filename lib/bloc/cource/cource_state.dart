part of 'cource_bloc.dart';

abstract class CourceState extends Equatable {
  const CourceState();

  @override
  List<Object> get props => [];
}

class CourceLoadingState extends CourceState {}

class CourceLoadedState extends CourceState {
  final List<CourceModel> cources;
  const CourceLoadedState(this.cources);
  @override
  List<Object> get props => [cources];
}

class CourceErrorState extends CourceState {
  final String message;
  const CourceErrorState(this.message);
  @override
  List<Object> get props => [message];
}
