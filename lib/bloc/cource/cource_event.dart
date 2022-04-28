part of 'cource_bloc.dart';

abstract class CourceEvent extends Equatable {
  const CourceEvent();

  @override
  List<Object> get props => [];
}

class LoadCourceEvent extends CourceEvent {}

class TapOnCourceEvent extends CourceEvent {
  final CourceModel cource;
  const TapOnCourceEvent(this.cource);
  @override
  List<Object> get props => [cource];
}
