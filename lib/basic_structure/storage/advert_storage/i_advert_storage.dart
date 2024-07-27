import 'package:apsiyon/core/model/advert.dart';

abstract class IAdvertStorage {
  Future<void> saveAdvert(Advert advert);
  Future<List<Advert>> fetchAdverts();
}
