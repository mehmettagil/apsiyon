import 'package:apsiyon/basic_structure/failure/login_repository_failure.dart';
import 'package:dartz/dartz.dart';

abstract class ILoginRepository {
  Future<Either<LoginRepositoryFailure, bool>> login(
      {required String email, required String password});
  
}
