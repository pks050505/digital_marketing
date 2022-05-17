import 'package:bloc/bloc.dart';
import 'package:digital_marketing/api/cource_repository.dart';
import 'package:digital_marketing/dao/models.dart';

import 'package:equatable/equatable.dart';

part 'allcource_event.dart';
part 'allcource_state.dart';

class AllCourceBloc extends Bloc<AllCourceEvent, AllCourceState> {
  final CourceRepository courceRepository;
  AllCourceBloc(this.courceRepository) : super(AllCourceLoading()) {
    on<LoadAllCourceEvent>((event, emit) async {
      emit(AllCourceLoading());
      try {
        await Future.delayed(const Duration(seconds: 3));
        var cources = await courceRepository.getAllCources();
        emit(AllCourceLoaded(cources!));
      } catch (e) {
        emit(AllCourceError(e.toString()));
      }
    });
  }
}
