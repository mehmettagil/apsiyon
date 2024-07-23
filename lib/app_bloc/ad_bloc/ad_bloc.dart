import 'dart:async';

import 'package:apsiyon/basic_structure/repository/ad_repository/ad_repository.dart';
import 'package:apsiyon/basic_structure/repository/ad_repository/i_ad_repository.dart';
import 'package:apsiyon/basic_structure/repository/failure/game_repository_failure.dart';
import 'package:apsiyon/core/model/ad_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kt_dart/kt.dart';

part 'ad_event.dart';
part 'ad_state.dart';

class HouseAdBloc extends Bloc<HouseAdEvent, HouseAdState> {
  HouseAdBloc(this._iAdRepository) : super(HouseAdState.initial()) {
    on<HouseAdInitialEvent>(_onHouseAdInitialEvent);
    on<HouseAdUpdateTooltipValueEvent>(_onChartUpdateTooltipValueEvent);
  }
  addHouseAdInitialEvent() {
    add(const HouseAdInitialEvent());
  }

  final IAdRepository _iAdRepository;

  Future<void> _onHouseAdInitialEvent(
      HouseAdInitialEvent event, Emitter<HouseAdState> emit) async {
    
    final adList = await _iAdRepository.getAd();
    emit(state.copyWith(adList: some(adList)));
  }

  Future<void> _onChartUpdateTooltipValueEvent(
      HouseAdUpdateTooltipValueEvent event, Emitter<HouseAdState> emit) async {
    emit(state.copyWith(tooltipValue: event.tooltipValue));
  }
}
