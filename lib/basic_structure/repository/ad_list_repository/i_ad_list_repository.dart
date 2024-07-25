import 'package:apsiyon/basic_structure/repository/failure/game_repository_failure.dart';
import 'package:apsiyon/core/model/ad_list_model.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

abstract class IAdListRepository {
  Future<Either<AdRepositoryFailure, KtList<AdListModel>>> getAdList();
}
