part of 'ad_bloc.dart';

class HouseAdState extends Equatable {
  const HouseAdState({
    required this.valueWidth,
    required this.tooltipValue,
    required this.adList,
  });

  factory HouseAdState.initial() {
    return HouseAdState(
      valueWidth: 0,
      tooltipValue: "",
      adList: none(),
    );
  }

  final int valueWidth;
  final String tooltipValue;
  final Option<Either<AdRepositoryFailure, KtList<AdModel>>> adList;

  HouseAdState copyWith({
    int? valueWidth,
    String? tooltipValue,
    Option<Either<AdRepositoryFailure, KtList<AdModel>>>? adList,
  }) {
    return HouseAdState(
      valueWidth: valueWidth ?? this.valueWidth,
      tooltipValue: tooltipValue ?? this.tooltipValue,
      adList: adList ?? this.adList,
    );
  }

  KtList<AdModel>? get adListOrCrash => adList.fold(() {
        return null;
      }, (model) {
        return model.fold((failure) {
          return null;
        }, (adList) {
          return adList;
        });
      });

  @override
  // TODO: implement props
  List<Object> get props => [valueWidth, tooltipValue, adList];
  @override
  bool get stringify => true;
}
