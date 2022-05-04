class VideoState {
  final String url;
  VideoState(this.url);
  factory VideoState.empty() {
    return VideoState('');
  }
  VideoState copyWith({String? url}) {
    return VideoState(url ?? this.url);
  }
}
