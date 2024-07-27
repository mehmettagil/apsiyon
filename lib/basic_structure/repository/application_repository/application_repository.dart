// import 'package:dartz/dartz.dart';
// import 'package:apsiyon/core/model/application.dart';
// import 'package:apsiyon/basic_structure/repository/failure/application_repository_failure.dart';
// import 'package:apsiyon/basic_structure/storage/application_storage/i_application_storage.dart';
// import 'package:apsiyon/basic_structure/repository/application_repository/i_application_repository.dart';

// class ApplicationRepository implements IApplicationRepository {
//   final IApplicationStorage _applicationStorage;

//   ApplicationRepository(this._applicationStorage);

//   @override
//   Future<Either<ApplicationRepositoryFailure, void>> addApplication(Application application) async {
//     try {
//       await _applicationStorage.saveApplication(application);
//       return Right(null);
//     } catch (e) {
//       return Left(ApplicationRepositoryFailure('Başvuru kaydedilemedi'));
//     }
//   }
// }
