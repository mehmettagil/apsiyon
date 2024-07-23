import 'package:equatable/equatable.dart';

abstract class AdRepositoryFailure extends Equatable {
  const AdRepositoryFailure();

  @override
  List<Object?> get props => [];

  @override
  bool? get stringify => true;
}


class AdRepositoryInternalFailure extends AdRepositoryFailure {
  const AdRepositoryInternalFailure();
}

class AdRepositoryNotFoundFailure extends AdRepositoryFailure{
  const AdRepositoryNotFoundFailure();
}

class AdRepositoryConnectionFailure extends AdRepositoryFailure {
  const AdRepositoryConnectionFailure();
}

class AdRepositoryUnknownFailure extends AdRepositoryFailure{
  const AdRepositoryUnknownFailure(this._message);
  final String? _message;

  @override
  String toString() {
    return "AdRepositoryUnknownFailure(); Exception message was: $message";
  }

  @override
  List<Object?> get props => [_message];

  @override
  String? get message => _message;
}
