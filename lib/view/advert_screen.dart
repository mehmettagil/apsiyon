import 'package:apsiyon/app_bloc/login/login_bloc.dart';
import 'package:apsiyon/core/model/advert.dart';
import 'package:apsiyon/view/user_adlist/user_adlist_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:apsiyon/app_bloc/advert_bloc/advert_bloc.dart';
import 'package:uuid/uuid.dart';

class AdvertScreen extends StatefulWidget {
  const AdvertScreen({super.key});

  @override
  _AdvertScreenState createState() => _AdvertScreenState();
}

class _AdvertScreenState extends State<AdvertScreen> {
  final TextEditingController _siteAdiController = TextEditingController();
  final TextEditingController _fiyatController = TextEditingController();
  final TextEditingController _m2Controller = TextEditingController();
  final TextEditingController _odaSayisiController = TextEditingController();
  final TextEditingController _binaYasiController = TextEditingController();
  final TextEditingController _bulunduguKatController = TextEditingController();

  void _addAdvert({required String username}) {
    final advert = Advert(
      siteAdi: _siteAdiController.text,
      fiyat: double.parse(_fiyatController.text),
      m2: double.parse(_m2Controller.text),
      odaSayisi: int.parse(_odaSayisiController.text),
      binaYasi: int.parse(_binaYasiController.text),
      bulunduguKat: int.parse(_bulunduguKatController.text),
      kullaniciAdi: username,
      id: const Uuid().v4(),
    );

    context.read<AdVertBloc>().add(AdvertAddEvent(advert: advert));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'İlan Ver',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2898FF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _siteAdiController,
              decoration: const InputDecoration(labelText: 'Site Adı'),
            ),
            TextField(
              controller: _fiyatController,
              decoration: const InputDecoration(labelText: 'Fiyat'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _m2Controller,
              decoration: const InputDecoration(labelText: 'M2'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _odaSayisiController,
              decoration: const InputDecoration(labelText: 'Oda Sayısı'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _binaYasiController,
              decoration: const InputDecoration(labelText: 'Bina Yaşı'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _bulunduguKatController,
              decoration: const InputDecoration(labelText: 'Bulunduğu Kat'),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),
            BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: () {
                    _addAdvert(username: state.username);
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserAdListView()));
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF2898FF),
                  ),
                  child: const Text('İlan Ver'),
                );
              },
            ),
            BlocListener<AdVertBloc, AdVertState>(
              listener: (context, state) {
                // if (state is AdvertSuccess) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text('İlan başarıyla eklendi')),
                //   );
                // } else if (state is AdvertFailure) {
                //   ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text('İlan eklenemedi')),
                //   );
                // }
              },
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
