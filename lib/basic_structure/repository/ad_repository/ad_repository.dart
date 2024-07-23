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
            description: 'Hastaneye Yakın, Bahçeli',
            price: '14000 TL',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s',
            isLiked: false),
        const AdModel(
            adNo: '1002',
            siteName: 'Göl Konakları',
            description: 'Göl manzaralı, lüks daire',
            price: '25000 TL',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s',
            isLiked: false),
        const AdModel(
            adNo: '1003',
            siteName: 'Yıldız Apartmanı',
            description: 'Merkezi konum, yeni bina',
            price: '17000 TL',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s',
            isLiked: false),
        const AdModel(
            adNo: '1004',
            siteName: 'Koru Evleri',
            description: 'Doğa ile iç içe, geniş bahçe',
            price: '20000 TL',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s',
            isLiked: false),
        const AdModel(
            adNo: '1005',
            siteName: 'Altınpark Sitesi',
            description: 'Güvenlikli site, sosyal tesisler',
            price: '22000 TL',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s',
            isLiked: false),
        const AdModel(
            adNo: '1006',
            siteName: 'Şehir Merkez Apart',
            description: 'Ulaşım kolaylığı, metroya yakın',
            price: '16000 TL',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s',
            isLiked: false),
        const AdModel(
            adNo: '1007',
            siteName: 'Çiçek Apartmanı',
            description: 'Yeşil alanlar, park yeri',
            price: '13000 TL',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s',
            isLiked: false),
        const AdModel(
            adNo: '1008',
            siteName: 'Modern Rezidans',
            description: 'Fitness salonu, kapalı otopark',
            price: '28000 TL',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s',
            isLiked: false),
        const AdModel(
            adNo: '1009',
            siteName: 'Deniz Yıldızı Evleri',
            description: 'Deniz manzaralı, geniş balkon',
            price: '30000 TL',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s',
            isLiked: false),
        const AdModel(
            adNo: '1010',
            siteName: 'Bağcılar Sitesi',
            description: 'Aile yaşamına uygun, geniş daire',
            price: '15000 TL',
            imageUrl:
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s',
            isLiked: false),
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