import 'dart:io';

import 'package:apsiyon/app_bloc/ad_bloc/ad_bloc.dart';
import 'package:apsiyon/app_bloc/ad_list_bloc/ad_list_bloc.dart';
import 'package:apsiyon/basic_structure/repository/ad_list_repository/ad_list_repository.dart';
import 'package:apsiyon/basic_structure/repository/ad_list_repository/i_ad_list_repository.dart';
import 'package:apsiyon/basic_structure/repository/ad_repository/ad_repository.dart';
import 'package:apsiyon/basic_structure/repository/ad_repository/i_ad_repository.dart';
import 'package:apsiyon/basic_structure/storage/ad_storage.dart';
import 'package:apsiyon/basic_structure/storage/i_ad_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

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
  getIt.registerFactory<AdListBloc>(() => AdListBloc(
        getIt<IAdListRepository>(),
      ));

  return true;
}

Future<bool> _injectFacades() async {
  getIt.registerSingleton<IAdRepository>(AdRepository());
  getIt.registerSingleton<IAdListRepository>(AdListRepository());

  return true;
}

Future<bool> _injectStorage() async {
  await Hive.initFlutter();
  await Hive.openBox("ad");
  getIt.registerSingleton<IAdStorage>(AdStorage());
  return true;
}
