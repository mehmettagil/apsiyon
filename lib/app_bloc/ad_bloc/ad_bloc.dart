import 'dart:async';

import 'package:apsiyon/basic_structure/repository/ad_repository/i_ad_repository.dart';
import 'package:apsiyon/basic_structure/repository/failure/game_repository_failure.dart';
import 'package:apsiyon/basic_structure/storage/i_ad_storage.dart';
import 'package:apsiyon/core/model/ad_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kt_dart/kt.dart';

part 'ad_event.dart';
part 'ad_state.dart';

class AdBloc extends Bloc<AdEvent, AdState> {
  AdBloc(
    this._iAdRepository,
    this._iAdStorage,
  ) : super(AdState.initial()) {
    on<AdInitialEvent>(_onAdInitialEvent);
    on<AdCahngeLikeStatusEvent>(_onAdCahngeLikeStatusEvent);
  }
  addAdInitialEvent() {
    add(const AdInitialEvent());
  }

  addAdChangeLikeStatusEvent({required AdModel adModel}) {
    add(AdCahngeLikeStatusEvent(adModel));
  }

  final IAdRepository _iAdRepository;
  final IAdStorage _iAdStorage;

  Future<void> _onAdInitialEvent(
      AdInitialEvent event, Emitter<AdState> emit) async {
    final adList = _iAdStorage.getAd();
    if (adList.isEmpty) {
      final adList = await _iAdRepository.getAd();
      final adListModel = adList.fold((a) {
        return null;
      }, (model) => model.asList());
      if (adListModel != null) {
        await _iAdStorage.putAd(adList: adListModel);
        emit(state.copyWith(adList: some(adList)));
      }
    } else {
      final adListModel = adList.map((e) => AdModel.fromMap(e)).toList();
      emit(state.copyWith(adList: some(right(KtList.from(adListModel)))));
    }
  }

  Future<void> _onAdCahngeLikeStatusEvent(
      AdCahngeLikeStatusEvent event, Emitter<AdState> emit) async {
    await _iAdStorage.changeLikedAd(adNo: event.adModel.adNo);
  }
}
