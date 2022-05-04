import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'videoplayer_event.dart';
part 'videoplayer_state.dart';

class VideoplayerBloc extends Bloc<VideoplayerEvent, VideoplayerState> {
  VideoplayerBloc() : super(VideoplayerInitial()) {
    on<VideoplayerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
