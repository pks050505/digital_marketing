part of 'videoplayer_bloc.dart';

abstract class VideoplayerEvent extends Equatable {
  const VideoplayerEvent();

  @override
  List<Object> get props => [];
}

//PlayNextVideoEvent
//pauseEvent
//fullscreenEvent
//resumeEvent
class PlayNextVideo extends VideoplayerEvent {
  final String url;
  const PlayNextVideo(this.url);
  @override
  List<Object> get props => [url];
}
