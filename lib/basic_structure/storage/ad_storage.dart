
import 'package:apsiyon/basic_structure/storage/i_ad_storage.dart';
import 'package:apsiyon/core/model/ad_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AdStorage implements IAdStorage {
  AdStorage();

  final store = Hive.box("Ad");
  final homeAd = "homeAd";

  @override
  Future<void> putAd({
    required List<AdModel> adList,
  }) async {
    try {
      final data = getAd();
      if (data.isEmpty) {
        return await store.put(
            homeAd,
            adList.map(
              (e) => e.toMap(),
            ));
      }
    } catch (_) {}
  }

  @override
  Future<void> changeLikedAd({
    required String adNo,
  }) async {
    try {
      final data = getAd();
      final isWrite = data.contains(adNo);
      if (!isWrite) {
        List<AdModel> adList = data.map((e) => AdModel.fromMap(e)).toList();
        adList.map((element) {
          if (element.adNo == adNo) {
            // Belirli öğe bulundu, `isLiked` durumunu tersine çevir
            element.copyWith(isLiked: !element.isLiked);
          }
          // Diğer öğeleri olduğu gibi bırak
          element;
        }).toList();

        return await store.put(homeAd, adList);
      }
    } catch (_) {}
  }

  @override
  List<dynamic> getAd() {
    try {
      final result = store.get(homeAd);
      return result;
    } catch (_) {
      return [];
    }
  }
}
