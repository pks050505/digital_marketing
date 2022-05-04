import 'package:equatable/equatable.dart';

class Offer extends Equatable {
  final String id;
  final String title;
  final String content;
  // ignore: non_constant_identifier_names
  final OfferType offer_type;
  const Offer(this.content, this.id, this.offer_type, this.title);
  @override
  List<Object?> get props => [id, content, offer_type, title];
  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      json['content'],
      json['id'],
      json['offer_type'],
      json['title'],
    );
  }
}

enum OfferType {
  red,
  green,
}
