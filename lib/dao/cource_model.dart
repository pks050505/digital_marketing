import 'package:digital_marketing/screen/home_page.dart';

class CourceModel {
  final String courceId;
  final String courceName;
  final String courceUrl;
  final String courceCategory;
  final double rating;
  final String instructorName; //for instructor name & instructor picture
  final String instructorUrl;

  const CourceModel({
    required this.courceName,
    required this.courceUrl,
    required this.courceId,
    required this.courceCategory,
    required this.instructorName,
    required this.instructorUrl,
    required this.rating,
  });
  factory CourceModel.fromJson(Map<String, dynamic> json) {
    return CourceModel(
      courceName: json['courceName'],
      courceUrl: json['CourceUrl'],
      courceCategory: json['courceCategory'],
      courceId: json['courceId'],
      instructorName: json['instructorName'],
      instructorUrl: json['instructorUrl'],
      rating: json['rating'],
    );
  }
  static List<CourceModel> cources = [
    CourceModel(
      courceId: 'courceId1',
      courceCategory: 'Finance',
      courceName: 'Digital Marketing',
      courceUrl: imageUrll,
      instructorName: 'Ravi Krishna',
      instructorUrl: imageUrll,
      rating: 4.4,
      // description: 'This is cource of digital marketing description',
      // image: courceUrl,
    ),
    CourceModel(
      courceId: 'courceId2',
      courceCategory: 'Education',
      courceName: 'Forex Trading',
      courceUrl: imageUrll,
      instructorName: 'Krishna',
      instructorUrl: imageUrll,
      rating: 4.4,
      // description: 'This is cource of digital marketing description',
      // image: courceUrl,
    ),
    CourceModel(
      courceId: 'courceId3',
      courceCategory: 'Finance',
      courceName: 'Digital Marketing',
      courceUrl: imageUrll,
      instructorName: 'Purushottam',
      instructorUrl: imageUrll,
      rating: 4.4,
      // description: 'This is cource of digital marketing description',
      // image: courceUrl,
    ),
    CourceModel(
      courceId: 'courceId4',
      courceCategory: 'Finance',
      courceName: 'Digital Marketing',
      courceUrl: imageUrll,
      instructorName: 'Krishna',
      instructorUrl: imageUrll,
      rating: 4.4,
      // description: 'This is cource of digital marketing description',
      // image: courceUrl,
    ),
    CourceModel(
      courceId: 'courceId5',
      courceCategory: 'Finance',
      courceName: 'Forex Trading',
      courceUrl: imageUrll,
      instructorName: 'Krishna',
      instructorUrl: imageUrll,
      rating: 4.4,
      // description: 'This is cource of digital marketing description',
      // image: courceUrl,
    ),
    CourceModel(
      courceId: 'courceId6',
      courceCategory: 'Finance',
      courceName: 'Crypto',
      courceUrl: imageUrll,
      instructorName: 'Krishna',
      instructorUrl: imageUrll,
      rating: 4.4,
      // description: 'This is cource of digital marketing description',
      // image: courceUrl,
    ),
  ];
}
