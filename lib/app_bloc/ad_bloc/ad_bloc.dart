import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';


part 'ad_event.dart';
part 'ad_state.dart';

class HouseAdBloc extends Bloc<HouseAdEvent, HouseAdState> {
  HouseAdBloc() : super(HouseAdState.initial()) {
    on<HouseAdInitialEvent>(_onHouseAdInitialEvent);
    on<HouseAdUpdateTooltipValueEvent>(_onChartUpdateTooltipValueEvent);
  }
  addHouseAdInitialEvent() {
    add(const HouseAdInitialEvent());
  }

  Future<void> _onHouseAdInitialEvent(
      HouseAdInitialEvent event, Emitter<HouseAdState> emit) async {}

  Future<void> _onChartUpdateTooltipValueEvent(
      HouseAdUpdateTooltipValueEvent event, Emitter<HouseAdState> emit) async {
    emit(state.copyWith(tooltipValue: event.tooltipValue));
  }
}
