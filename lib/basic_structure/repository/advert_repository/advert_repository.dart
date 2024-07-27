import 'package:dartz/dartz.dart';
import 'package:apsiyon/core/model/advert.dart';
import 'package:apsiyon/basic_structure/repository/failure/advert_repository_failure.dart';
import 'package:apsiyon/basic_structure/storage/advert_storage/i_advert_storage.dart';
import 'package:apsiyon/basic_structure/repository/advert_repository/i_advert_repository.dart';

class AdvertRepository implements IAdvertRepository {
  final IAdvertStorage _advertStorage;

  AdvertRepository(this._advertStorage);

  @override
  Future<Either<AdvertRepositoryFailure, List<Advert>>> fetchAdverts() async {
    try {
      final adverts = await _advertStorage.fetchAdverts();
      return Right(adverts);
    } catch (e) {
      return Left(AdvertRepositoryFailure('İlanlar yüklenemedi'));
    }
  }
//
}
