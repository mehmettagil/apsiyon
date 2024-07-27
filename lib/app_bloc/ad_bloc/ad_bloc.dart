import 'dart:async';

import 'package:apsiyon/basic_structure/repository/ad_repository/i_ad_repository.dart';
import 'package:apsiyon/basic_structure/repository/failure/game_repository_failure.dart';
import 'package:apsiyon/basic_structure/storage/i_ad_storage.dart';
import 'package:apsiyon/core/enum/ad_filter_type.dart';
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
    on<AdUpdateNearFilterEvent>(_onAdUpdateNearFilterEvent);
    on<AdChangeLikeStatusEvent>(_onAdChangeLikeStatusEvent);
    on<AdUpdatePriceFilterEvent>(_onAdUpdatePriceFilterEvent);
    on<AdUpdateRoomFilterEvent>(_onAdUpdateRoomFilterEvent);
    on<AdUpdateBuildingAgeFilterEvent>(_onAdUpdateBuildingAgeFilterEvent);
    on<AdUpdateFloorFilterEvent>(_onAdUpdateFloorFilterEvent);
    on<AdUpdateM2FilterEvent>(_onAdUpdateM2FilterEvent);
  }

  final IAdRepository _iAdRepository;
  final IAdStorage _iAdStorage;

  Future<void> addAdInitialEvent() async {
    add(const AdInitialEvent());
  }

  Future<void> addAdChangeLikeStatusEvent({required AdModel adModel}) async {
    add(AdChangeLikeStatusEvent(adModel));
  }

  Future<void> addAdUpdatePriceFilterEvent(
      {int? minPrice, int? maxPrice}) async {
    add(AdUpdatePriceFilterEvent(minPrice: minPrice, maxPrice: maxPrice));
  }

  Future<void> addAdUpdateRoomFilterEvent(
      List<String> selectedRoomTypes) async {
    add(AdUpdateRoomFilterEvent(selectedRoomTypes));
  }

  Future<void> addAdUpdateBuildingAgeFilterEvent(
      List<String> selectedBuildingAges) async {
    add(AdUpdateBuildingAgeFilterEvent(selectedBuildingAges));
  }

  Future<void> addAdUpdateFloorFilterEvent(
      List<String> selectedFloorCounts) async {
    add(AdUpdateFloorFilterEvent(selectedFloorCounts));
  }

  Future<void> addAdUpdateM2FilterEvent({int? minM2, int? maxM2}) async {
    add(AdUpdateM2FilterEvent(minM2: minM2, maxM2: maxM2));
  }

  Future<void> addAdUpdateFiltersEvent(
      Map<AdFilterType, List<String>> selectedFilters) async {
    add(AdUpdateFiltersEvent(selectedFilters));
  }

  Future<void> _onAdInitialEvent(
      AdInitialEvent event, Emitter<AdState> emit) async {
    final adList =  _iAdStorage.getAd();
    if (adList.isEmpty) {
      final adResult = await _iAdRepository.getAd();
      adResult.fold(
        (failure) =>
            emit(state.copyWith(adList: none())), // Hata durumunu yönet
        (model) async {
          final adListModel = model.asList();
          await _iAdStorage.putAd(adList: adListModel);
          emit(state.copyWith(adList: some(right(KtList.from(adListModel)))));
        },
      );
    } else {
      final adListModel = adList.map((e) => AdModel.fromMap(e)).toList();
      emit(state.copyWith(adList: some(right(KtList.from(adListModel)))));
    }
  }

  Future<void> _onAdChangeLikeStatusEvent(
      AdChangeLikeStatusEvent event, Emitter<AdState> emit) async {
    await _iAdStorage.changeLikedAd(adNo: event.adModel.adNo);
  }

  Future<void> _onAdUpdatePriceFilterEvent(
      AdUpdatePriceFilterEvent event, Emitter<AdState> emit) async {
    final updatedState = state.copyWith(
      minPrice: event.minPrice,
      maxPrice: event.maxPrice,
    );
    emit(updatedState);
  }

  Future<void> _onAdUpdateRoomFilterEvent(
      AdUpdateRoomFilterEvent event, Emitter<AdState> emit) async {
    final updatedState = state.copyWith(
      selectedRoomTypes: event.selectedRoomTypes,
    );
    emit(updatedState);
  }

  Future<void> _onAdUpdateBuildingAgeFilterEvent(
      AdUpdateBuildingAgeFilterEvent event, Emitter<AdState> emit) async {
    final updatedState = state.copyWith(
      selectedBuildingAges: event.selectedBuildingAges,
    );
    emit(updatedState);
  }

  Future<void> _onAdUpdateFloorFilterEvent(
      AdUpdateFloorFilterEvent event, Emitter<AdState> emit) async {
    final updatedState = state.copyWith(
      selectedFloorCounts: event.selectedFloorCounts,
    );
    emit(updatedState);
  }

  Future<void> _onAdUpdateM2FilterEvent(
      AdUpdateM2FilterEvent event, Emitter<AdState> emit) async {
    final updatedState = state.copyWith(
      minM2: event.minM2,
      maxM2: event.maxM2,
    );
    emit(updatedState);
  }

  Future<void> _onAdUpdateNearFilterEvent(
      AdUpdateNearFilterEvent event, Emitter<AdState> emit) async {
    final updatedState = state.copyWith(
      distance: event.selectedNear,
    );
    emit(updatedState);
  }
}
