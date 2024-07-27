import 'package:apsiyon/app_bloc/ad_bloc/ad_bloc.dart';
import 'package:apsiyon/app_bloc/ad_list_bloc/ad_list_bloc.dart';
import 'package:apsiyon/app_bloc/advert_bloc/advert_bloc.dart';
import 'package:apsiyon/app_bloc/login/login_bloc.dart';
import 'package:apsiyon/basic_structure/repository/ad_list_repository/ad_list_repository.dart';
import 'package:apsiyon/basic_structure/repository/ad_list_repository/i_ad_list_repository.dart';
import 'package:apsiyon/basic_structure/repository/ad_repository/ad_repository.dart';
import 'package:apsiyon/basic_structure/repository/ad_repository/i_ad_repository.dart';
import 'package:apsiyon/basic_structure/repository/advert_repository/advert_repository.dart';
import 'package:apsiyon/basic_structure/repository/advert_repository/i_advert_repository.dart';
import 'package:apsiyon/basic_structure/repository/users_repository/i_login_repository.dart';
import 'package:apsiyon/basic_structure/repository/users_repository/login_repository.dart';
import 'package:apsiyon/basic_structure/storage/ad_storage.dart';
import 'package:apsiyon/basic_structure/storage/advert_storage/advert_storage.dart';
import 'package:apsiyon/basic_structure/storage/advert_storage/i_advert_storage.dart';
import 'package:apsiyon/basic_structure/storage/i_ad_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<bool> injected() async {
  GetIt.asNewInstance();
  final isPackageDone = await _injectPackages();
  if (!isPackageDone) return false;
  final isStorageDone = await _injectStorage();
  if (!isStorageDone) return false;

  final isFacadeDone = await _injectFacades();
  if (!isFacadeDone) return false;

  final isBlocDone = await _injectBlocs();
  if (!isBlocDone) return false;

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
  getIt.registerFactory<AdVertBloc>(() => AdVertBloc(
        getIt<IAdvertStorage>(),
        getIt<IAdvertRepository>(),
      ));
  getIt.registerFactory<LoginBloc>(() => LoginBloc(
        getIt<ILoginRepository>(),
      ));

  return true;
}

Future<bool> _injectFacades() async {
  getIt.registerSingleton<IAdRepository>(AdRepository());
  getIt.registerSingleton<IAdListRepository>(AdListRepository());

  getIt.registerSingleton<IAdvertRepository>(AdvertRepository(
    getIt<IAdvertStorage>(),
  ));
  getIt.registerSingleton<ILoginRepository>(LoginRepository());

  return true;
}

Future<bool> _injectStorage() async {
  await Hive.initFlutter();
  await Hive.openBox("ad");
  await Hive.openBox("adverts");
  getIt.registerSingleton<IAdStorage>(AdStorage());
  getIt.registerSingleton<IAdvertStorage>(AdvertStorage());

  return true;
}
