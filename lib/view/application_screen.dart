// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:apsiyon/core/model/application.dart';
// import 'package:apsiyon/app_bloc/application_bloc/application_bloc.dart';
// import 'package:apsiyon/app_bloc/application_bloc/application_event.dart';
// import 'package:apsiyon/app_bloc/application_bloc/application_state.dart';

// class ApplicationScreen extends StatefulWidget {
//   final String username;

//   const ApplicationScreen({required this.username});

//   @override
//   _ApplicationScreenState createState() => _ApplicationScreenState();
// }

// class _ApplicationScreenState extends State<ApplicationScreen> {
//   final TextEditingController _siteAdiController = TextEditingController();
//   final TextEditingController _fiyatController = TextEditingController();
//   final TextEditingController _m2Controller = TextEditingController();
//   final TextEditingController _odaSayisiController = TextEditingController();
//   final TextEditingController _binaYasiController = TextEditingController();
//   final TextEditingController _bulunduguKatController = TextEditingController();

//   void _applyAdvert() {
//     final application = Application(
//       siteAdi: _siteAdiController.text,
//       fiyat: double.parse(_fiyatController.text),
//       m2: double.parse(_m2Controller.text),
//       odaSayisi: int.parse(_odaSayisiController.text),
//       binaYasi: int.parse(_binaYasiController.text),
//       bulunduguKat: int.parse(_bulunduguKatController.text),
//       kullaniciAdi: widget.username,
//     );

//     context.read<ApplicationBloc>().add(AddApplication(application));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Başvuru Yap'),
//         backgroundColor: const Color(0xFF2898FF),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             TextField(
//               controller: _siteAdiController,
//               decoration: const InputDecoration(labelText: 'Site Adı'),
//             ),
//             TextField(
//               controller: _fiyatController,
//               decoration: const InputDecoration(labelText: 'Fiyat'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: _m2Controller,
//               decoration: const InputDecoration(labelText: 'M2'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: _odaSayisiController,
//               decoration: const InputDecoration(labelText: 'Oda Sayısı'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: _binaYasiController,
//               decoration: const InputDecoration(labelText: 'Bina Yaşı'),
//               keyboardType: TextInputType.number,
//             ),
//             TextField(
//               controller: _bulunduguKatController,
//               decoration: const InputDecoration(labelText: 'Bulunduğu Kat'),
//               keyboardType: TextInputType.number,
//             ),
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _applyAdvert,
//               style: ElevatedButton.styleFrom(
//                 foregroundColor: Colors.white,
//                 backgroundColor: const Color(0xFF2898FF),
//               ),
//               child: const Text('Başvuru Yap'),
//             ),
//             BlocListener<ApplicationBloc, ApplicationState>(
//               listener: (context, state) {
//                 if (state is ApplicationSuccess) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Başvuru başarıyla yapıldı')),
//                   );
//                 } else if (state is ApplicationFailure) {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Başvuru yapılamadı')),
//                   );
//                 }
//               },
//               child: Container(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
