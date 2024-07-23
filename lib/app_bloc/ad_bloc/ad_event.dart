

part of 'ad_bloc.dart';

abstract class HouseAdEvent extends Equatable {
  const HouseAdEvent();
  @override
  List<Object> get props => [];
}

class HouseAdInitialEvent extends HouseAdEvent {
  const HouseAdInitialEvent();
}

class HouseAdUpdateTooltipValueEvent extends HouseAdEvent {
  const HouseAdUpdateTooltipValueEvent(this.tooltipValue);
  final String tooltipValue;
  @override
  List<Object> get props => [tooltipValue];
}
