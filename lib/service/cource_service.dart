import 'package:digital_marketing/dao/models.dart';

import '../screen/home_page.dart';

abstract class CourceService {
  Future<List<CourceModel>> getAllCources();
  Future<List<InstructorModel>> getAllInstructors();
}

class CourceServiceImpl implements CourceService {
  @override
  Future<List<CourceModel>> getAllCources() async {
    try {
      return await Future.value(cources);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<List<InstructorModel>> getAllInstructors() async {
    try {
      return await Future.value(instructors);
    } catch (e) {
      throw Exception();
    }
  }
}

List<InstructorModel> instructors = [
  InstructorModel(
      email: 'instructor@gmail.com',
      instructorId: 'ins1',
      instructorPic: imageUrll,
      name: 'Purushottam Singh'),
  InstructorModel(
      email: 'instructor@hotmail.com',
      instructorId: 'ins2',
      instructorPic: imageUrll,
      name: 'Ravi yadav'),
  InstructorModel(
      email: 'instructor@gmail.com',
      instructorId: 'ins3',
      instructorPic: imageUrll,
      name: 'Krishna Sir'),
  InstructorModel(
    email: 'instructor@gmail.com',
    instructorId: 'ins4',
    instructorPic: imageUrll,
    name: 'Shivam ',
  ),
];

List<CourceModel> cources = [
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
