import '../dao/cource_model.dart';
import '../screen/home_page.dart';
import 'base_api.dart';

class CourceRepository extends BaseApi {
  @override
  Future<List<CourceModel>?> getAllCources() async {
    try {
      return Future.delayed(const Duration(seconds: 25)).then((value) {
        return [
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
      });
    } catch (e) {}
  }

  @override
  Future<List<CourceModel>?> trandingCources() async {
    try {
      return Future.delayed(const Duration(seconds: 6)).then((value) {
        return <CourceModel>[
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
      });
    } catch (e) {}
  }
}
// final String courceId;
//   final String courceName;
//   final String courceUrl;
//   final String courceCategory;
//   final double rating;
//   final String instructorName; //for instructor name & instructor picture
//   final String instructorUrl;