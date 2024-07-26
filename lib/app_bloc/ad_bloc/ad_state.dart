part of 'ad_bloc.dart';

class AdState extends Equatable {
  const AdState({
    required this.valueWidth,
    required this.distance,
    required this.tooltipValue,
    required this.adList,
    required this.minPrice,
    required this.maxPrice,
    required this.selectedRoomTypes,
    required this.selectedBuildingAges,
    required this.selectedFloorCounts,
    required this.minM2,
    required this.maxM2,
    required this.selectedFilters,
  });

  factory AdState.initial() {
    return AdState(
      valueWidth: 0,
      distance: 0,
      tooltipValue: "",
      adList: none(),
      minPrice: null,
      maxPrice: null,
      selectedRoomTypes: const [],
      selectedBuildingAges: const [],
      selectedFloorCounts: const [],
      minM2: null,
      maxM2: null,
      selectedFilters: const {}, // Başlangıçta filtreler boş
    );
  }

  final int valueWidth;
  final double distance;
  final String tooltipValue;
  final Option<Either<AdRepositoryFailure, KtList<AdModel>>> adList;
  final int? minPrice;
  final int? maxPrice;
  final List<String> selectedRoomTypes;
  final List<String> selectedBuildingAges;
  final List<String> selectedFloorCounts;
  final int? minM2;
  final int? maxM2;
  final Map<AdFilterType, List<String>> selectedFilters;

  AdState copyWith({
    int? valueWidth,
    double? distance,
    String? tooltipValue,
    Option<Either<AdRepositoryFailure, KtList<AdModel>>>? adList,
    int? minPrice,
    int? maxPrice,
    List<String>? selectedRoomTypes,
    List<String>? selectedBuildingAges,
    List<String>? selectedFloorCounts,
    int? minM2,
    int? maxM2,
    Map<AdFilterType, List<String>>? selectedFilters,
  }) {
    return AdState(
      valueWidth: valueWidth ?? this.valueWidth,
      distance: distance ?? this.distance,
      tooltipValue: tooltipValue ?? this.tooltipValue,
      adList: adList ?? this.adList,
      minPrice: minPrice ?? this.minPrice,
      maxPrice: maxPrice ?? this.maxPrice,
      selectedRoomTypes: selectedRoomTypes ?? this.selectedRoomTypes,
      selectedBuildingAges: selectedBuildingAges ?? this.selectedBuildingAges,
      selectedFloorCounts: selectedFloorCounts ?? this.selectedFloorCounts,
      minM2: minM2 ?? this.minM2,
      maxM2: maxM2 ?? this.maxM2,
      selectedFilters: selectedFilters ?? this.selectedFilters,
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
  List<Object?> get props => [
        valueWidth,
        distance,
        tooltipValue,
        adList,
        minPrice,
        maxPrice,
        selectedRoomTypes,
        selectedBuildingAges,
        selectedFloorCounts,
        minM2,
        maxM2,
        selectedFilters,
      ];

  @override
  bool get stringify => true;
}
