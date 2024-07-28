import 'package:apsiyon/app_bloc/ad_bloc/ad_bloc.dart';
import 'package:apsiyon/app_bloc/ad_list_bloc/ad_list_bloc.dart';
import 'package:apsiyon/app_bloc/advert_bloc/advert_bloc.dart';
import 'package:apsiyon/app_bloc/login/login_bloc.dart';
import 'package:apsiyon/injection.dart';
import 'package:apsiyon/view/filter/filter_view.dart';
import 'package:apsiyon/view/house_ad/house_ad_view.dart';
import 'package:apsiyon/view/login_screen.dart';
import 'package:apsiyon/view/reference/reference_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injected();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        BlocProvider<LoginBloc>(create: (_) => getIt<LoginBloc>()),
        BlocProvider<AdVertBloc>(create: (_) => getIt<AdVertBloc>()),
      ],
      child: MaterialApp(
          title: 'Apsiyon',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const LoginScreen()),
    );
  }
}
