import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:digital_marketing/dao/models.dart';
import 'package:digital_marketing/service/cource_service.dart';
import 'package:equatable/equatable.dart';
part 'instructor_event.dart';
part 'instructor_state.dart';

class InstructorBloc extends Bloc<InstructorEvent, InstructorState> {
  final CourceService courceService;
  InstructorBloc(this.courceService) : super(InstructorLoadingState()) {
    on<LoadInstructorEvent>(_loadInstructorEvent);
  }

  FutureOr<void> _loadInstructorEvent(
    LoadInstructorEvent event,
    Emitter<InstructorState> emit,
  ) async {
    emit(InstructorLoadingState());
    try {
      Future.delayed(const Duration(seconds: 40));
      print('instructor loading');
      var instructors = await courceService.getAllInstructors();
      emit(InstructorLoadedState(instructors));
    } catch (e) {
      emit(const InstructorErrorState('Instructor Not Loading'));
    }
  }
}
