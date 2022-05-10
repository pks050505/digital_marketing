import 'dart:async';

import 'package:better_player/better_player.dart';
import 'package:digital_marketing/bloc/video/video_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marquee/marquee.dart';
import 'video_event.dart';

//"https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
class VideoBloc extends Bloc<VideoEvent, VideoControllerState> {
  // ConnectivitySevice connectivitySevice;
//this.connectivitySevice
  VideoBloc() : super(VideoControllerInitial()) {
    on<NextVideo>(_nextVideo);
    on<InitialEvent>(_initial);
  }
  FutureOr<void> _initial(
      InitialEvent event, Emitter<VideoControllerState> emit) {
    emit(VideoControllerInitial());
  }

  FutureOr<void> _nextVideo(
    NextVideo event,
    Emitter<VideoControllerState> emit,
  ) async {
    try {
      var config = BetterPlayerConfiguration(
        deviceOrientationsAfterFullScreen: [
          DeviceOrientation.portraitUp,
        ],
        overlay: Opacity(
          opacity: 0.2,
          child: Marquee(
            text: 'name  email@email.com',
            blankSpace: 300,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
        ),
        autoPlay: true,
        autoDispose: true,
        expandToFill: true,
      );

      // connectivitySevice.connectivityStream.stream.listen((connection) {
      //   if (connection == ConnectivityResult.none) {
      //     emit(NotConnectedToInternet());
      //   } else {
      final controller = BetterPlayerController(
        config,
        betterPlayerDataSource: BetterPlayerDataSource.network(
          event.videoUrl,
        ),
      );
      emit(
        VideoControllerLoaded(
          controller,
        ),
      );
      //   }
      // });
    } catch (e) {}
  }
}
