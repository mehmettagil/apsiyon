import 'package:apsiyon/app_bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apsiyon/view/filter/filter_view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
        backgroundColor: const Color(0xFF2898FF),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: MultiBlocListener(
            listeners: [
              _getLoginCheckListener(),
            ],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'Rentsion',
                  style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF2898FF),
                  ),
                ),
                const SizedBox(height: 40),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return TextField(
                      onChanged: (value) {
                        context
                            .read<LoginBloc>()
                            .addLoginEmailChangeEvent(username: value);
                      },
                      decoration: InputDecoration(
                        labelText: 'Kullanıcı Adı',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0xFF2898FF),
                            width: 2.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                BlocBuilder<LoginBloc, LoginState>(
                  builder: (context, state) {
                    return TextField(
                      onChanged: (value) {
                        context
                            .read<LoginBloc>()
                            .addLoginPasswordChangeEvent(password: value);
                      },
                      decoration: InputDecoration(
                        labelText: 'Şifre',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12.0),
                          borderSide: const BorderSide(
                            color: Color(0xFF2898FF),
                            width: 2.0,
                          ),
                        ),
                      ),
                      obscureText: true,
                    );
                  },
                ),
                const SizedBox(height: 20),
                BlocConsumer<LoginBloc, LoginState>(
                  listenWhen: (previous, current) {
                    return previous.processFailureOrUnitOption !=
                        current.processFailureOrUnitOption;
                  },
                  listener: (context, state) {
                    state.processFailureOrUnitOption.fold(
                      () => null,
                      (either) {
                        either.fold(
                          (failure) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Kullanıcılar yüklenemedi: ${failure.toString()}'),
                              ),
                            );
                          },
                          (success) {
                            if (success) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => const FilterView(),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                      Text('Geçersiz kullanıcı adı veya şifre'),
                                ),
                              );
                            }
                          },
                        );
                      },
                    );
                  },
                  builder: (context, state) {
                    return ElevatedButton(
                      onPressed: () {
                        context.read<LoginBloc>().addLoginCompleteEvent();
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF2898FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 12),
                      ),
                      child: const Text('Giriş Yap'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

BlocListener<LoginBloc, LoginState> _getLoginCheckListener() {
  return BlocListener<LoginBloc, LoginState>(
    listenWhen: (previous, current) {
      return previous.processFailureOrUnitOption !=
          current.processFailureOrUnitOption;
    },
    listener: (context, state) {
      if (state.processFailureOrUnitOption.isSome()) {
        final failure =
            state.processFailureOrUnitOption.fold(() => null, (a) => a);
        if (failure!.isRight()) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: context.read<LoginBloc>(),
                    child: const FilterView(),
                  ),
                ));
          });
        }
      }
    },
  );
}
