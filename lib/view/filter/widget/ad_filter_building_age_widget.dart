import 'package:apsiyon/app_bloc/ad_bloc/ad_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdFilterBuildingAgeWidget extends StatefulWidget {
  const AdFilterBuildingAgeWidget({super.key});

  @override
  _AdFilterBuildingAgeWidgetState createState() => _AdFilterBuildingAgeWidgetState();
}

class _AdFilterBuildingAgeWidgetState extends State<AdFilterBuildingAgeWidget> {
  final Map<String, bool> _ageOptions = {
    '0': false,
    '1': false,
    '2': false,
    '3': false,
    '4-5': false,
    '6-10': false,
    '11-15': false,
    '16-20': false,
    '21-25': false,
    '26-30': false,
    '31 ve üzeri': false,
  };

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Bina Yaşını Seçin'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _ageOptions.keys.map((String key) {
            return CheckboxListTile(
              title: Text(key),
              value: _ageOptions[key],
              onChanged: (bool? value) {
                setState(() {
                  _ageOptions[key] = value ?? false;
                });
              },
            );
          }).toList(),
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
            final selectedOptions = _ageOptions.entries
                .where((entry) => entry.value)
                .map((entry) => entry.key)
                .toList();
                context.read<AdBloc>().add(AdUpdateBuildingAgeFilterEvent(selectedOptions));
            Navigator.of(context).pop(); 
          },
          child: const Text('Tamam'),
        ),
      ],
    );
  }
}