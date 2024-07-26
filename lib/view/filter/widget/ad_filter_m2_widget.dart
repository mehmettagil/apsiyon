import 'package:apsiyon/app_bloc/ad_bloc/ad_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdFilterM2Widget extends StatelessWidget {
  const AdFilterM2Widget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController minM2Controller = TextEditingController();
    final TextEditingController maxM2Controller = TextEditingController();

    return AlertDialog(
      title: const Text('M2 Aralığı Seçin'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: minM2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'En Az M2',
              ),
            ),
            TextField(
              controller: maxM2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'En Çok M2',
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('İptal'),
        ),
        TextButton(
          onPressed: () {
            final minM2 = minM2Controller.text;
            final maxM2 = maxM2Controller.text;
            context.read<AdBloc>().add(AdUpdateM2FilterEvent(
                minM2: int.parse(minM2), maxM2: int.parse(maxM2)));
            Navigator.of(context).pop();
          },
          child: const Text('Tamam'),
        ),
      ],
    );
  }
}
