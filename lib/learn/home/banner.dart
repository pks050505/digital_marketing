import 'package:equatable/equatable.dart';

// [home][home_banner] display in carausel slider
class Banner extends Equatable {
  final String url;
  final String id;
  const Banner(this.id, this.url);
  @override
  List<Object?> get props => [id, url];
  factory Banner.fromJson(Map<String, dynamic> json) {
    return Banner(json['id'], json['url']);
  }
  @override
  String toString() {
    return "Banner {'id':$id ,'url':$url}";
  }
}
