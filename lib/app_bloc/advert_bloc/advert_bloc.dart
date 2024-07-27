import 'dart:async';

import 'package:apsiyon/basic_structure/repository/advert_repository/i_advert_repository.dart';
import 'package:apsiyon/basic_structure/repository/failure/advert_repository_failure.dart';
import 'package:apsiyon/basic_structure/storage/advert_storage/i_advert_storage.dart';

import 'package:apsiyon/core/model/advert.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'advert_event.dart';
part 'advert_state.dart';

class AdVertBloc extends Bloc<AdVertEvent, AdVertState> {
  AdVertBloc(
    this._iAadvertStorage,
    this._iAdvertRepository,
  ) : super(AdVertState.initial()) {
    on<AdvertInitialEvent>(_onAdVertInitialEvent);
    on<AdvertAddEvent>(_onAdvertAddEvent);
  }

  final IAdvertStorage _iAadvertStorage;
  final IAdvertRepository _iAdvertRepository;

  Future<void> _onAdVertInitialEvent(
      AdvertInitialEvent event, Emitter<AdVertState> emit) async {
    final advert = await _iAdvertRepository.fetchAdverts();

    emit(state.copyWith(porccesFaiureOrAdvert: some(advert)));
  }

  Future<void> _onAdvertAddEvent(
      AdvertAddEvent event, Emitter<AdVertState> emit) async {
    final result = await _iAadvertStorage.saveAdvert(event.advert);
    emit(state.copyWith(porccesFaiureOrUnit: some(right(unit))));
  }
}
