part of 'instructor_bloc.dart';

abstract class InstructorEvent extends Equatable {
  const InstructorEvent();

  @override
  List<Object> get props => [];
}

class LoadInstructorEvent extends InstructorEvent {}
