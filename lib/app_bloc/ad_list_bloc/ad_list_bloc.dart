import 'dart:async';

import 'package:apsiyon/basic_structure/repository/ad_list_repository/i_ad_list_repository.dart';
import 'package:apsiyon/basic_structure/repository/failure/game_repository_failure.dart';

import 'package:apsiyon/core/model/ad_list_model.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:kt_dart/kt.dart';

part 'ad_list_event.dart';
part 'ad_list_state.dart';

class AdListBloc extends Bloc<AdListEvent, AdListState> {
  AdListBloc(
    this._iAdListRepository,
  ) : super(AdListState.initial()) {
    on<AdListInitialEvent>(_onAdListInitialEvent);
  }
  adListdAdListInitialEvent() {
    add(const AdListInitialEvent());
  }

  final IAdListRepository _iAdListRepository;

  Future<void> _onAdListInitialEvent(
      AdListInitialEvent event, Emitter<AdListState> emit) async {
    final adList = await _iAdListRepository.getAdList();

    emit(state.copyWith(adList: some(adList)));
  }
}
