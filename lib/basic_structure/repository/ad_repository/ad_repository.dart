import 'package:apsiyon/basic_structure/repository/ad_repository/i_ad_repository.dart';
import 'package:apsiyon/basic_structure/repository/failure/game_repository_failure.dart';
import 'package:apsiyon/core/model/ad_model.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

class AdRepository implements IAdRepository {
  AdRepository();

  @override
  Future<Either<AdRepositoryFailure, KtList<AdModel>>> getAd() async {
    try {
      List<AdModel> dummyAds = [
        const AdModel(
          adNo: '1001',
          siteName: 'Esenevler Sitesi',
          description: 'Hastaneye yakın, bahçeli daire',
          price: 14000,
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s',
          isLiked: false,
          distance: 5.0,
          m2: 120.0,
          roomCount: '3+1',
          buildingAge: '5',
          floorCount: '2',
        ),
        const AdModel(
          adNo: '1002',
          siteName: 'Göl Konakları',
          description: 'Göl manzaralı, lüks daire',
          price: 25000,
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s',
          isLiked: false,
          distance: 3.0,
          m2: 150.0,
          roomCount: '4+1',
          buildingAge: '2',
          floorCount: '5',
        ),
        const AdModel(
          adNo: '1003',
          siteName: 'Yıldız Apartmanı',
          description: 'Merkezi konum, yeni bina',
          price: 17000,
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s',
          isLiked: false,
          distance: 1.0,
          m2: 110.0,
          roomCount: '2+1',
          buildingAge: '1',
          floorCount: '3',
        ),
        const AdModel(
          adNo: '1004',
          siteName: 'Koru Evleri',
          description: 'Doğa ile iç içe, geniş bahçe',
          price: 20000,
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s',
          isLiked: false,
          distance: 8.0,
          m2: 180.0,
          roomCount: '5+1',
          buildingAge: '7',
          floorCount: '1',
        ),
        const AdModel(
          adNo: '1005',
          siteName: 'Altınpark Sitesi',
          description: 'Güvenlikli site, sosyal tesisler',
          price: 22000,
          imageUrl:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s',
          isLiked: false,
          distance: 4.0,
          m2: 135.0,
          roomCount: '3+1',
          buildingAge: '10',
          floorCount: '4',
        ),
      ];

      return right(KtList.from([...dummyAds]));
    } catch (e) {
      return left(AdRepositoryUnknownFailure(e.toString()));
    }
  }

  AdRepositoryFailure? _handleGeneralErrors(
      int statusCode, Map<String, dynamic> result) {
    if (statusCode == 200) return null;

    final errorMap = result[0]['error'] as Map<String, dynamic>?;

    final message = errorMap?['message'] as String?;
    if (statusCode == 404) {
      return const AdRepositoryNotFoundFailure();
    } else if (statusCode == 500) {
      return const AdRepositoryInternalFailure();
    } else {
      return AdRepositoryUnknownFailure(message);
    }
  }
}
