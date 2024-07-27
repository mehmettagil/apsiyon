// import 'package:bloc/bloc.dart';
// import 'package:apsiyon/core/model/application.dart';
// import 'package:apsiyon/app_bloc/application_bloc/application_event.dart';
// import 'package:apsiyon/app_bloc/application_bloc/application_state.dart';
// import 'package:apsiyon/basic_structure/repository/application_repository/i_application_repository.dart';

// class ApplicationBloc extends Bloc<ApplicationEvent, ApplicationState> {
//   final IApplicationRepository _applicationRepository;

//   ApplicationBloc(this._applicationRepository) : super(ApplicationInitial());

//   @override
//   Stream<ApplicationState> mapEventToState(ApplicationEvent event) async* {
//     if (event is AddApplication) {
//       yield ApplicationLoading();
//       final result = await _applicationRepository.addApplication(event.application);
//       yield result.fold(
//             (failure) => ApplicationFailure(failure.message),
//             (_) => ApplicationSuccess(),
//       );
//     }
//   }
// }
