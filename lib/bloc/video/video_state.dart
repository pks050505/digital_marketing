import 'package:better_player/better_player.dart';
import 'package:equatable/equatable.dart';

abstract class VideoControllerState extends Equatable {
  const VideoControllerState();
  @override
  List<Object?> get props => [];
}

class VideoControllerInitial extends VideoControllerState {}

class NotConnectedToInternet extends VideoControllerState {}

class VideoControllerLoaded extends VideoControllerState {
  final BetterPlayerController controller;
  const VideoControllerLoaded(this.controller);
  @override
  List<Object?> get props => [controller];
}
