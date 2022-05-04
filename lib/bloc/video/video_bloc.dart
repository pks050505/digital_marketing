import 'dart:async';

import 'package:digital_marketing/bloc/video/video_event.dart';
import 'package:digital_marketing/bloc/video/video_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

var vidUrl =
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  VideoBloc() : super(VideoState(vidUrl)) {
    on<NextVideo>(_nextVideo);
    //  on<DisposeVideo>(_dispose);
  }

  FutureOr<void> _nextVideo(
    NextVideo event,
    Emitter<VideoState> emit,
  ) async {
    emit(VideoState(event.videoUrl));
  }

  // FutureOr<void> _dispose(
  //   DisposeVideo event,
  //   Emitter<VideoState> emit,
  // ) {

  // }
  // emit(VideoLoading());
  // print('bloc loading next');
  // BetterPlayerDataSource betterPlayerDataSource =
  //     await BetterPlayerDataSource(
  //   BetterPlayerDataSourceType.network,
  //   event.videoUrl,
  // );
  // print('betterPlayer dataSource ');
  // BetterPlayerController _controller = await BetterPlayerController(
  //   BetterPlayerConfiguration(
  //       overlay: Opacity(
  //     opacity: 0.2,
  //     child: Marquee(
  //       text: 'user name    email@gmail.com',
  //       blankSpace: 300,
  //       crossAxisAlignment: CrossAxisAlignment.center,
  //     ),
  //   )),
  //   betterPlayerDataSource: betterPlayerDataSource,
  // );
  // print('controller initializing');
  // var initialize = _controller.isVideoInitialized();
  // print('intialize bool? $initialize');
  // if (initialize == null || initialize == false) {
  //   print('error state');
  //   emit(VideoError());
  // } else {
  //   print('loaded state');
  //   emit(VideoLoaded(_controller));
  // }

  @override
  Future<void> close() {
    return super.close();
  }
}

// class VideoCubit extends Cubit<VideoState> {
//   VideoCubit(
//     String url, {
//     bool autoPlay = true,
//     bool controlsVisible = false,
//   }) : super(VideoState.initialize(
//           url: url,
         
//         )) {
        
//     // state.initialize().then((_) {
//     //   emit(state.copyWith(
//     //     loaded: true,
//     //   ));
//     //   if (autoPlay) {
//     //     state.controller.play();
//     //   }
//     // }).onError((error, stackTrace) {
//     //   print(error);
//     //   print(stackTrace);
//     // });
//   }

//   void togglePlay() {
//     state.playing ? state.controller.pause() : state.controller.play();
//     emit(state.copyWith(
//       playing: !state.playing,
//     ));
//   }

//   void toggleControlsVisibility() {
//     emit(state.copyWith(
//       controlsVisible: !state.controlsVisible,
//     ));

//     if (state.controlsNotVisible && state.notPlaying) {
//       togglePlay();
//     }
//   }

//   void setVolume(
//     double value,
//   ) {
//     state.controller.setVolume(value);
//     emit(state.copyWith(
//       volume: value,
//     ));
//   }

//   void toggleMute() {
//     var newState = state.copyWith(
//       volume: state.mute ? state.volumeBeforeMute : 0,
//       volumeBeforeMute: state.notMute ? state.volume : state.volumeBeforeMute,
//     );
//     state.controller.setVolume(newState.volume);
//     emit(newState);
//   }
// }
