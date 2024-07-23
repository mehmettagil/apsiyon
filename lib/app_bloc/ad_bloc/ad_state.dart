part of 'ad_bloc.dart';

class HouseAdState extends Equatable {
  const HouseAdState({
    required this.valueWidth,
    required this.tooltipValue,
  });

  factory HouseAdState.initial() {
    return const HouseAdState(
      valueWidth: 0,
      tooltipValue: "",
    );
  }

  final int valueWidth;
  final String tooltipValue;

  HouseAdState copyWith({
    int? valueWidth,
    String? tooltipValue,
  }) {
    return HouseAdState(
      valueWidth: valueWidth ?? this.valueWidth,
      tooltipValue: tooltipValue ?? this.tooltipValue,
    );
  }

  @override
  // TODO: implement props
  List<Object> get props => [
        valueWidth,
        tooltipValue,
      ];
  @override
  bool get stringify => true;
}
