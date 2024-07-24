import 'dart:io';

import 'package:apsiyon/app_bloc/ad_bloc/ad_bloc.dart';
import 'package:apsiyon/basic_structure/repository/ad_repository/ad_repository.dart';
import 'package:apsiyon/basic_structure/repository/ad_repository/i_ad_repository.dart';
import 'package:apsiyon/basic_structure/storage/ad_storage.dart';
import 'package:apsiyon/basic_structure/storage/i_ad_storage.dart';
import 'package:get_it/get_it.dart';

import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<bool> injected() async {
  GetIt.asNewInstance();
  final isPackageDone = await _injectPackages();
  if (!isPackageDone) return false;

  final isFacadeDone = await _injectFacades();
  if (!isFacadeDone) return false;

  final isBlocDone = await _injectBlocs();
  if (!isBlocDone) return false;

  final isStorageDone = await _injectStorage();

  return true;
}

Future<bool> _injectPackages() async {
  final pref = await SharedPreferences.getInstance();

  getIt.registerSingleton<SharedPreferences>(pref);

  return true;
}

Future<bool> _injectBlocs() async {
  getIt.registerFactory<AdBloc>(() => AdBloc(
        getIt<IAdRepository>(),
        getIt<IAdStorage>(),
      ));

  return true;
}

Future<bool> _injectFacades() async {
  getIt.registerSingleton<IAdRepository>(AdRepository());
  return true;
}

Future<bool> _injectStorage() async {
  getIt.registerSingleton<IAdStorage>(AdStorage());
  return true;
}
