part of 'advert_bloc.dart';

abstract class AdVertEvent extends Equatable {
  const AdVertEvent();
  @override
  List<Object> get props => [];
}
class AdvertAddEvent extends AdVertEvent {
  final Advert advert;
  const AdvertAddEvent({
    required this.advert,
  });
  @override
  List<Object> get props => [advert];
}

class AdvertInitialEvent extends AdVertEvent {
  const AdvertInitialEvent();
  @override
  List<Object> get props => [];
}
