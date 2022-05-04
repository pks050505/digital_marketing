import 'package:equatable/equatable.dart';

abstract class VideoEvent extends Equatable {
  const VideoEvent();
  @override
  List<Object?> get props => [];
}

class NextVideo extends VideoEvent {
  final String videoUrl;
  const NextVideo(this.videoUrl);
  @override
  List<Object?> get props => [videoUrl];
}
