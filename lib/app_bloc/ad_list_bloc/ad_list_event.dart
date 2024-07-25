part of 'ad_list_bloc.dart';

abstract class AdListEvent extends Equatable {
  const AdListEvent();
  @override
  List<Object> get props => [];
}

class AdListInitialEvent extends AdListEvent {
  const AdListInitialEvent();
}




