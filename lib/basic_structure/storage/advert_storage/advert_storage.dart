import 'package:hive_flutter/hive_flutter.dart';

import 'i_advert_storage.dart';
import 'package:apsiyon/core/model/advert.dart';

class AdvertStorage implements IAdvertStorage {
  final String boxName = 'users';
  final store = Hive.box("adverts");

  @override
  Future<void> saveAdvert(Advert advert) async {
    final advertList = await fetchAdverts();

    // Yeni ilanı ekle
    advertList.add(advert);

    // Güncellenmiş listeyi kaydet
    await store.put(
        boxName, advertList.map((advert) => advert.toMap()).toList());
  }

  @override
  Future<List<Advert>> fetchAdverts() async {
    List<dynamic> advertList = store.get(boxName, defaultValue: []);
    return advertList.map((e) => Advert.fromMap(e)).toList();
  }
}
