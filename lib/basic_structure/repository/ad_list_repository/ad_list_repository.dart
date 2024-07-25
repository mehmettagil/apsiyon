import 'package:apsiyon/basic_structure/repository/ad_list_repository/i_ad_list_repository.dart';
import 'package:apsiyon/basic_structure/repository/failure/game_repository_failure.dart';
import 'package:apsiyon/core/model/ad_list_model.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

class AdListRepository implements IAdListRepository {
  AdListRepository();

  @override
  Future<Either<AdRepositoryFailure, KtList<AdListModel>>> getAdList() async {
    try {
      List<AdListModel> dummyAdList = [
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/men/1.jpg",
          name: "Ali",
          surname: "Yılmaz",
          adNo: "AD001",
          adDate: "2024-01-01",
          isReference: true,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/women/2.jpg",
          name: "Ayşe",
          surname: "Demir",
          adNo: "AD002",
          adDate: "2024-02-01",
          isReference: false,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/women/3.jpg",
          name: "Fatma",
          surname: "Kara",
          adNo: "AD003",
          adDate: "2024-03-01",
          isReference: true,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/men/4.jpg",
          name: "Mehmet",
          surname: "Öztürk",
          adNo: "AD004",
          adDate: "2024-04-01",
          isReference: false,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/women/5.jpg",
          name: "Elif",
          surname: "Arslan",
          adNo: "AD005",
          adDate: "2024-05-01",
          isReference: true,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/women/6.jpg",
          name: "Zeynep",
          surname: "Çelik",
          adNo: "AD006",
          adDate: "2024-06-01",
          isReference: false,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/men/7.jpg",
          name: "Mert",
          surname: "Polat",
          adNo: "AD007",
          adDate: "2024-07-01",
          isReference: true,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/men/8.jpg",
          name: "Deniz",
          surname: "Koç",
          adNo: "AD008",
          adDate: "2024-08-01",
          isReference: false,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/women/9.jpg",
          name: "Sevil",
          surname: "Güler",
          adNo: "AD009",
          adDate: "2024-09-01",
          isReference: true,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/men/10.jpg",
          name: "Kemal",
          surname: "Tuna",
          adNo: "AD010",
          adDate: "2024-10-01",
          isReference: false,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/women/11.jpg",
          name: "Burcu",
          surname: "Altun",
          adNo: "AD011",
          adDate: "2024-11-01",
          isReference: true,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/men/12.jpg",
          name: "Emre",
          surname: "Yücel",
          adNo: "AD012",
          adDate: "2024-12-01",
          isReference: false,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/women/13.jpg",
          name: "Cansu",
          surname: "Şahin",
          adNo: "AD013",
          adDate: "2024-12-01",
          isReference: true,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/men/14.jpg",
          name: "Volkan",
          surname: "Acar",
          adNo: "AD014",
          adDate: "2024-12-01",
          isReference: false,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/women/15.jpg",
          name: "Ebru",
          surname: "Kaya",
          adNo: "AD015",
          adDate: "2024-12-01",
          isReference: true,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/men/16.jpg",
          name: "Barış",
          surname: "Kara",
          adNo: "AD016",
          adDate: "2024-12-01",
          isReference: false,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/women/17.jpg",
          name: "Gizem",
          surname: "Uslu",
          adNo: "AD017",
          adDate: "2024-12-01",
          isReference: true,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/men/18.jpg",
          name: "Ahmet",
          surname: "Ersoy",
          adNo: "AD018",
          adDate: "2024-12-01",
          isReference: false,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/women/19.jpg",
          name: "Selin",
          surname: "Demirci",
          adNo: "AD019",
          adDate: "2024-12-01",
          isReference: true,
        ),
        const AdListModel(
          peopleImage: "https://randomuser.me/api/portraits/men/20.jpg",
          name: "Oğuz",
          surname: "Tan",
          adNo: "AD020",
          adDate: "2024-12-01",
          isReference: false,
        ),
      ];

      return right(KtList.from([...dummyAdList]));
    } catch (e) {
      return left(AdRepositoryUnknownFailure(e.toString()));
    }
  }

  AdRepositoryFailure? _handleGeneralErrors(
      int statusCode, Map<String, dynamic> result) {
    if (statusCode == 200) return null;

    final errorMap = result[0]['error'] as Map<String, dynamic>?;

    final message = errorMap?['message'] as String?;
    if (statusCode == 404) {
      return const AdRepositoryNotFoundFailure();
    } else if (statusCode == 500) {
      return const AdRepositoryInternalFailure();
    } else {
      return AdRepositoryUnknownFailure(message);
    }
  }
}
