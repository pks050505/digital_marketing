import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:digital_marketing/api/instructor_repository.dart';
import 'package:digital_marketing/dao/models.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
part 'instructor_event.dart';
part 'instructor_state.dart';

class InstructorBloc extends Bloc<InstructorEvent, InstructorState> {
  // final CourceService courceService;
  final InstructorRepository instructorRepository;
  InstructorBloc(this.instructorRepository) : super(InstructorLoadingState()) {
    on<LoadInstructorEvent>(_loadInstructorEvent);
  }

  FutureOr<void> _loadInstructorEvent(
    LoadInstructorEvent event,
    Emitter<InstructorState> emit,
  ) async {
    emit(InstructorLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 6));
      print('instructor loading');
      var instructors = await instructorRepository.getAllInstructors();

      emit(InstructorLoadedState(instructors!));
    } catch (e) {
      emit(InstructorErrorState(e.toString()));
    }
  }
}
