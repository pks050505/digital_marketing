part of 'instructor_bloc.dart';

abstract class InstructorState extends Equatable {
  const InstructorState();

  @override
  List<Object> get props => [];
}

class InstructorLoadingState extends InstructorState {}

class InstructorLoadedState extends InstructorState {
  final List<InstructorModel> instructors;
  const InstructorLoadedState(this.instructors);
  @override
  List<Object> get props => [instructors];
}

class InstructorErrorState extends InstructorState {
  final String message;
  const InstructorErrorState(this.message);
  @override
  List<Object> get props => [message];
}
