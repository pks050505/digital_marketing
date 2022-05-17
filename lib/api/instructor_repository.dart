import 'package:digital_marketing/dao/models.dart';

import '../screen/home_page.dart';
import 'base_api.dart';

class InstructorRepository extends BaseApi {
  @override
  Future<List<InstructorModel>?> getAllInstructors() async {
    try {
      return Future.delayed(const Duration(milliseconds: 400)).then(
        (value) {
          return <InstructorModel>[
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
        },
      );
    } catch (e) {
      throw Exception('exception arrise for instructor repository');
    }
  }
}
