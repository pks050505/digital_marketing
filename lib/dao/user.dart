import 'package:digital_marketing/extra_screen/cource_detail_page.dart';

class User {
  final String? userId;
  final String? name;
  final String? address;
  final String? email;
  final String? phoneNo;
  final String? image;
  User({
    this.address,
    this.email,
    this.image,
    this.name,
    this.phoneNo,
    this.userId,
  });
}

class Instructor {
  final String? instructorId;
  final String? title;
  final String? designation;
  final String? description;
  final bool? status;
  final String? created_on;
  final String? updated_on;
  final String? image;
  final String? facebook;
  final String? twitter;
  final String? youtube;
  final String? instagram;
  Instructor({
    this.created_on,
    this.description,
    this.designation,
    this.facebook,
    this.image,
    this.instagram,
    this.instructorId,
    this.status,
    this.title,
    this.twitter,
    this.updated_on,
    this.youtube,
  });
}

class Cource {
  final String? courceId;
  final String? code;
  final String? cource_category;
  final String? title;
  final String? description;
  final String? image;
  final String? clip;
  final String? full_clip;
  final String? status;
  final String? created_on;
  final String? updated_on;
  Cource({
    this.clip,
    this.code,
    this.courceId,
    this.cource_category,
    this.created_on,
    this.description,
    this.full_clip,
    this.image,
    this.status,
    this.title,
    this.updated_on,
  });
  static List<Cource> cources = [
    Cource(
      courceId: 'courceId1',
      cource_category: 'Finance',
      title: 'Digital Marketing',
      description: 'This is cource of digital marketing description',
      image: courceUrl,
    ),
    Cource(
      courceId: 'courceId2',
      cource_category: 'Finance',
      title: 'Digital Marketing 1',
      description: 'This is cource of digital marketing description',
      image: courceUrl,
    ),
    Cource(
      courceId: 'courceId3',
      cource_category: 'Finance',
      title: 'Forex Trading',
      description: 'This is cource of digital marketing description',
      image: courceUrl,
    ),
    Cource(
      courceId: 'courceId4',
      cource_category: 'Finance',
      title: 'Content Writing',
      description: 'This is cource of digital marketing description',
      image: courceUrl,
    ),
    Cource(
      courceId: 'courceId5',
      cource_category: 'Finance',
      title: 'Digital Marketing',
      description: 'This is cource of digital marketing description',
      image: courceUrl,
    ),
    Cource(
      courceId: 'courceId6',
      cource_category: 'Finance',
      title: 'Digital Marketing',
      description: 'This is cource of digital marketing description',
      image: courceUrl,
    ),
  ];
}
