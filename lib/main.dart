import 'package:apsiyon/app_bloc/ad_bloc/ad_bloc.dart';
import 'package:apsiyon/app_bloc/ad_list_bloc/ad_list_bloc.dart';
import 'package:apsiyon/injection.dart';
import 'package:apsiyon/view/ad_list/ad_list.dart';
import 'package:apsiyon/view/filter/filter_view.dart';
import 'package:apsiyon/view/house_ad/house_ad_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injected();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AdBloc>(
          create: (_) => getIt<AdBloc>()..addAdInitialEvent(),
        ),
        BlocProvider<AdListBloc>(
          create: (_) => getIt<AdListBloc>()..adListdAdListInitialEvent(),
        ),
      ],
      child: MaterialApp(
          title: 'Apsiyon',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const FilterView()),
    );
  }
}
