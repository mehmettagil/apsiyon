import 'package:dartz/dartz.dart';
import 'package:apsiyon/core/model/advert.dart';
import 'package:apsiyon/basic_structure/repository/failure/advert_repository_failure.dart';

abstract class IAdvertRepository {
  Future<Either<AdvertRepositoryFailure, List<Advert>>> fetchAdverts();
}
