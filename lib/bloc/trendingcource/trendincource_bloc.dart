import 'package:bloc/bloc.dart';
import 'package:digital_marketing/api/cource_repository.dart';
import 'package:digital_marketing/dao/models.dart';
import 'package:equatable/equatable.dart';

part 'trendincource_event.dart';
part 'trendincource_state.dart';

class TrendincourceBloc extends Bloc<TrendincourceEvent, TrendincourceState> {
  final CourceRepository repository;
  TrendincourceBloc(this.repository) : super(TrendincourceLoading()) {
    on<LoadTendingCourceEvent>((event, emit) async {
      emit(TrendincourceLoading());
      try {
        await Future.delayed(const Duration(seconds: 3));
        var cources = await repository.trandingCources();
        emit(TrendingcourceLoaded(cources!));
      } catch (e) {
        emit(TrendingcourceError(e.toString()));
      }
    });
  }
}
