part of 'trendincource_bloc.dart';

abstract class TrendincourceEvent extends Equatable {
  const TrendincourceEvent();

  @override
  List<Object> get props => [];
}

class LoadTendingCourceEvent extends TrendincourceEvent {}
