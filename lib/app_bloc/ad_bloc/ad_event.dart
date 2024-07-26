part of 'ad_bloc.dart';

abstract class AdEvent extends Equatable {
  const AdEvent();
  @override
  List<Object> get props => [];
}

class AdInitialEvent extends AdEvent {
  const AdInitialEvent();
}


class AdChangeLikeStatusEvent extends AdEvent {
  const AdChangeLikeStatusEvent(this.adModel);
  final AdModel adModel;
  @override
  List<Object> get props => [adModel];
}

class AdUpdatePriceFilterEvent extends AdEvent {
  const AdUpdatePriceFilterEvent({this.minPrice, this.maxPrice});
  final int? minPrice;
  final int? maxPrice;
  @override
  List<Object> get props => [minPrice ?? 0, maxPrice ?? 0];
}

class AdUpdateRoomFilterEvent extends AdEvent {
  const AdUpdateRoomFilterEvent(this.selectedRoomTypes);
  final List<String> selectedRoomTypes;
  @override
  List<Object> get props => [selectedRoomTypes];
}
class AdUpdateNearFilterEvent extends AdEvent {
  const AdUpdateNearFilterEvent(this.selectedNear);
  final double selectedNear;
  @override
  List<Object> get props => [selectedNear];
}
class AdUpdateBuildingAgeFilterEvent extends AdEvent {
  const AdUpdateBuildingAgeFilterEvent(this.selectedBuildingAges);
  final List<String> selectedBuildingAges;
  @override
  List<Object> get props => [selectedBuildingAges];
}

class AdUpdateFloorFilterEvent extends AdEvent {
  const AdUpdateFloorFilterEvent(this.selectedFloorCounts);
  final List<String> selectedFloorCounts;
  @override
  List<Object> get props => [selectedFloorCounts];
}

class AdUpdateM2FilterEvent extends AdEvent {
  const AdUpdateM2FilterEvent({this.minM2, this.maxM2});
  final int? minM2;
  final int? maxM2;
  @override
  List<Object> get props => [minM2 ?? 0, maxM2 ?? 0];
}

class AdUpdateFiltersEvent extends AdEvent {
  const AdUpdateFiltersEvent(this.selectedFilters);
  final Map<AdFilterType, List<String>> selectedFilters;
  @override
  List<Object> get props => [selectedFilters];
}