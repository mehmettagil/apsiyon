part of 'advert_bloc.dart';

class AdVertState extends Equatable {
  const AdVertState({
    required this.porccesFaiureOrUnit,
    required this.porccesFaiureOrAdvert,
  });

  factory AdVertState.initial() {
    return AdVertState(
      porccesFaiureOrUnit: none(),
      porccesFaiureOrAdvert: none(),
    );
  }

  final Option<Either<AdvertRepositoryFailure, Unit>> porccesFaiureOrUnit;
  final Option<Either<AdvertRepositoryFailure, List<Advert>>>
      porccesFaiureOrAdvert;

  AdVertState copyWith({
    Option<Either<AdvertRepositoryFailure, Unit>>? porccesFaiureOrUnit,
    Option<Either<AdvertRepositoryFailure, List<Advert>>>?
        porccesFaiureOrAdvert,
  }) {
    return AdVertState(
      porccesFaiureOrUnit: porccesFaiureOrUnit ?? this.porccesFaiureOrUnit,
      porccesFaiureOrAdvert:
          porccesFaiureOrAdvert ?? this.porccesFaiureOrAdvert,
    );
  }

  List<Advert>? get advertListOrCrash =>
      porccesFaiureOrAdvert.fold(() => null, (advert) {
        return advert.fold((failure) => null, (advert) {
          return advert;
        });
      });

  @override
  List<Object> get props => [porccesFaiureOrUnit, porccesFaiureOrAdvert];
  @override
  bool get stringify => true;
}
