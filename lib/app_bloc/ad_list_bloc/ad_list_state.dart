part of 'ad_list_bloc.dart';

class AdListState extends Equatable {
  const AdListState({
    required this.adList,
  });

  factory AdListState.initial() {
    return AdListState(
      adList: none(),
    );
  }

  final Option<Either<AdRepositoryFailure, KtList<AdListModel>>> adList;

  AdListState copyWith({
    Option<Either<AdRepositoryFailure, KtList<AdListModel>>>? adList,
  }) {
    return AdListState(
      adList: adList ?? this.adList,
    );
  }

  KtList<AdListModel>? get adListListOrCrash => adList.fold(() {
        return null;
      }, (model) {
        return model.fold((failure) {
          return null;
        }, (AdListList) {
          return AdListList;
        });
      });

  @override
  // TODO: implement props
  List<Object> get props => [adList];
  @override
  bool get stringify => true;
}
