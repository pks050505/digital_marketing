part of 'trendincource_bloc.dart';

abstract class TrendincourceState extends Equatable {
  const TrendincourceState();

  @override
  List<Object> get props => [];
}

class TrendincourceLoading extends TrendincourceState {}

class TrendingcourceLoaded extends TrendincourceState {
  final List<CourceModel> cources;
  const TrendingcourceLoaded(this.cources);
  @override
  List<Object> get props => [cources];
}

class TrendingcourceError extends TrendincourceState {
  final String message;
  const TrendingcourceError(this.message);
  @override
  List<Object> get props => [message];
}
