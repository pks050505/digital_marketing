class UserModel {
  final String? userId;
  final String? name;
  final String? address;
  final String? email;
  final String? phoneNo;
  final String? image;
  final String? packageType;
  const UserModel({
    this.address,
    this.email,
    this.image,
    this.name,
    this.phoneNo,
    this.userId,
    this.packageType,
  });
  UserModel copyWith({
    String? userId,
    String? name,
    String? address,
    String? email,
    String? phoneNo,
    String? image,
    String? packageType,
  }) {
    return UserModel(
      email: userId ?? this.userId,
      name: name ?? this.name,
      address: address ?? this.address,
      image: image ?? this.image,
      phoneNo: phoneNo ?? this.phoneNo,
      packageType: packageType ?? this.packageType,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      image: json['image'],
      phoneNo: json['phoneNo'],
      userId: json['userId'],
      packageType: json['packageType'],
    );
  }
}

// class Instructor {
//   final String? instructorId;
//   final String? title;
//   final String? designation;
//   final String? description;
//   final bool? status;
//   final String? created_on;
//   final String? updated_on;
//   final String? image;
//   final String? facebook;
//   final String? twitter;
//   final String? youtube;
//   final String? instagram;
//   Instructor({
//     this.created_on,
//     this.description,
//     this.designation,
//     this.facebook,
//     this.image,
//     this.instagram,
//     this.instructorId,
//     this.status,
//     this.title,
//     this.twitter,
//     this.updated_on,
//     this.youtube,
//   });
// }

// class Cource {
//   final String? courceId;
//   final String? code;
//   final String? cource_category;
//   final String? title;
//   final String? description;
//   final String? image;
//   final String? clip;
//   final String? full_clip;
//   final String? status;
//   final String? created_on;
//   final String? updated_on;
//   Cource({
//     this.clip,
//     this.code,
//     this.courceId,
//     this.cource_category,
//     this.created_on,
//     this.description,
//     this.full_clip,
//     this.image,
//     this.status,
//     this.title,
//     this.updated_on,
//   });
//   static List<Cource> cources = [
//     Cource(
//       courceId: 'courceId1',
//       cource_category: 'Finance',
//       title: 'Digital Marketing',
//       description: 'This is cource of digital marketing description',
//       image: courceUrl,
//     ),
//     Cource(
//       courceId: 'courceId2',
//       cource_category: 'Finance',
//       title: 'Digital Marketing 1',
//       description: 'This is cource of digital marketing description',
//       image: courceUrl,
//     ),
//     Cource(
//       courceId: 'courceId3',
//       cource_category: 'Finance',
//       title: 'Forex Trading',
//       description: 'This is cource of digital marketing description',
//       image: courceUrl,
//     ),
//     Cource(
//       courceId: 'courceId4',
//       cource_category: 'Finance',
//       title: 'Content Writing',
//       description: 'This is cource of digital marketing description',
//       image: courceUrl,
//     ),
//     Cource(
//       courceId: 'courceId5',
//       cource_category: 'Finance',
//       title: 'Digital Marketing',
//       description: 'This is cource of digital marketing description',
//       image: courceUrl,
//     ),
//     Cource(
//       courceId: 'courceId6',
//       cource_category: 'Finance',
//       title: 'Digital Marketing',
//       description: 'This is cource of digital marketing description',
//       image: courceUrl,
//     ),
//   ];
// }
