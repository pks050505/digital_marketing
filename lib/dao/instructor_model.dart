import '../screen/home_page.dart';

class InstructorModel {
  final String instructorId;
  final String name;
  final String email;
  final String instructorPic;
  const InstructorModel(
      {required this.email,
      required this.instructorId,
      required this.instructorPic,
      required this.name});
  InstructorModel copyWith(
      {String? name, String? email, String? instructorPic}) {
    return InstructorModel(
      email: email ?? this.email,
      instructorId: instructorId,
      instructorPic: instructorPic ?? this.instructorPic,
      name: name ?? this.name,
    );
  }

  //for api call
  factory InstructorModel.fromJson(Map<String, dynamic> json) {
    return InstructorModel(
      email: json['email'],
      instructorId: json['instructorId'],
      instructorPic: json['instructorPic'],
      name: json['name'],
    );
  }
  static List<InstructorModel> instructors = [
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
}
