part of 'videoplayer_bloc.dart';

abstract class VideoplayerState extends Equatable {
  const VideoplayerState();

  @override
  List<Object> get props => [];
}

class VideoplayerInitial extends VideoplayerState {}

class VideoplayerLoadingState extends VideoplayerState {}

class VideoplayerLoadedState extends VideoplayerState {}

class VideoplayerErrorState extends VideoplayerState {}
