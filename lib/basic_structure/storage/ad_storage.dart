import 'package:apsiyon/basic_structure/storage/i_ad_storage.dart';
import 'package:apsiyon/core/model/ad_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AdStorage implements IAdStorage {
  AdStorage();

  final store = Hive.box("ad");
  final homeAd = "homeAd";

  @override
  Future<void> putAd({
    required List<AdModel> adList,
  }) async {
    try {
      final data = getAd();
      final putData = adList.map((e) => e.toMap()).toList();
      if (data.isEmpty) {
        return await store.put(homeAd, putData);
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
        adList = adList.map((element) {
          if (element.adNo == adNo) {
            // Belirli öğe bulundu, `isLiked` durumunu tersine çevir
            return element.copyWith(isLiked: !element.isLiked);
          }
          // Diğer öğeleri olduğu gibi bırak
          return element;
        }).toList();
        final putModel = adList.map((e) => e.toMap()).toList();

        return await store.put(homeAd, putModel);
      }
    } catch (_) {}
  }

  @override
  List<dynamic> getAd() {
    try {
      final result = store.get(homeAd);
      if (result == null) {
        return [];
      }
      return result;
    } catch (_) {
      return [];
    }
  }
}
