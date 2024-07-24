

part of 'ad_bloc.dart';

abstract class AdEvent extends Equatable {
  const AdEvent();
  @override
  List<Object> get props => [];
}

class AdInitialEvent extends AdEvent {
  const AdInitialEvent();
}

class AdUpdateTooltipValueEvent extends AdEvent {
  const AdUpdateTooltipValueEvent(this.tooltipValue);
  final String tooltipValue;
  @override
  List<Object> get props => [tooltipValue];
}
