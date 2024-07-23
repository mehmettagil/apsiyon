import 'package:apsiyon/core/model/ad_model.dart';

abstract class IAdStorage {
  Future<void> putAd({
    required List<AdModel> adList,
  });
  Future<void> changeLikedAd({
    required String adNo,
  });
  List<dynamic> getAd();
}
