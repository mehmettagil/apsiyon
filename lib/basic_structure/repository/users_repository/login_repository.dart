import 'package:apsiyon/basic_structure/failure/login_repository_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:apsiyon/core/model/user_list_model.dart';
import 'i_login_repository.dart';

class LoginRepository implements ILoginRepository {
  LoginRepository();

  @override
  Future<Either<LoginRepositoryFailure, bool>> login(
      {required String email, required String password}) async {
    try {
      List<UserListModel> usersAdList = [
        const UserListModel(
          peopleImage: "https://randomuser.me/api/portraits/men/21.jpg",
          name: "Ahmet",
          surname: "Yurt",
          adNo: "AD021",
          adDate: "2024-07-01",
          isReference: true,
          username: "ahmet",
          email: "ahmet.yurt@example.com",
          password: "123",
        ),
        const UserListModel(
          peopleImage: "https://randomuser.me/api/portraits/women/22.jpg",
          name: "Elif",
          surname: "Kara",
          adNo: "AD022",
          adDate: "2024-08-01",
          isReference: false,
          username: "elif",
          email: "elif.kara@example.com",
          password: "123",
        ),
        const UserListModel(
          peopleImage: "https://randomuser.me/api/portraits/men/23.jpg",
          name: "Burak",
          surname: "Çelik",
          adNo: "AD023",
          adDate: "2024-09-01",
          isReference: true,
          username: "burak",
          email: "burak.celik@example.com",
          password: "123",
        ),
      ];
      final user = usersAdList.where((element) {
        return element.username == email && element.password == password;
      });
      if (user.isNotEmpty) {
        return right(true);
      } else {
        return left(const LoginRepositoryNotFoundFailure());
      }
    } catch (e) {
      return left(LoginRepositoryUnknownFailure(e.toString()));
    }
  }
}
