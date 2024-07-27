import 'package:apsiyon/app_bloc/ad_bloc/ad_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdFilterPriceWidget extends StatelessWidget {
  const AdFilterPriceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController minPriceController = TextEditingController();
    final TextEditingController maxPriceController = TextEditingController();

    return AlertDialog(
      title: const Text('Fiyat Aralığı Seçin'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: minPriceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'En Az Fiyat',
              ),
            ),
            TextField(
              controller: maxPriceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'En Çok Fiyat',
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
            final minPrice = minPriceController.text;
            final maxPrice = maxPriceController.text;
            context.read<AdBloc>().add(AdUpdatePriceFilterEvent(
                minPrice: int.parse(minPrice == "" ? "0" : minPrice),
                maxPrice: int.parse(maxPrice == "" ? "0" : maxPrice)));
            Navigator.of(context).pop();
          },
          child: const Text('Tamam'),
        ),
      ],
    );
  }
}
