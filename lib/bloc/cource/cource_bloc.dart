import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:digital_marketing/dao/models.dart';
import 'package:digital_marketing/service/cource_service.dart';
import 'package:equatable/equatable.dart';

part 'cource_event.dart';
part 'cource_state.dart';

class CourceBloc extends Bloc<CourceEvent, CourceState> {
  final CourceService courceService;

  CourceBloc(this.courceService) : super(CourceLoadingState()) {
    on<LoadCourceEvent>(_loadCourceEvent);
  }

  FutureOr<void> _loadCourceEvent(
    LoadCourceEvent event,
    Emitter<CourceState> emit,
  ) async {
    emit(CourceLoadingState());
    try {
      Future.delayed(const Duration(seconds: 3));
      var cources = await courceService.getAllCources();
      emit(CourceLoadedState(cources));
    } catch (e) {
      emit(const CourceErrorState('Cources Not Loading..'));
    }
  }
}
