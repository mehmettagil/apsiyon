import 'package:apsiyon/basic_structure/repository/failure/game_repository_failure.dart';
import 'package:apsiyon/core/model/ad_model.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

abstract class IAdRepository {
  Future<Either<AdRepositoryFailure, KtList<AdModel>>> getAd();
}
