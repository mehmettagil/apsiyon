import 'package:apsiyon/app_bloc/ad_bloc/ad_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdFilterFloorWidget extends StatefulWidget {
  const AdFilterFloorWidget({super.key});

  @override
  _AdFilterFloorWidgetState createState() => _AdFilterFloorWidgetState();
}

class _AdFilterFloorWidgetState extends State<AdFilterFloorWidget> {
  final Map<String, bool> _floorOptions = {
    '1': false,
    '2': false,
    '3': false,
    '4': false,
    '5': false,
    '6': false,
    '7': false,
    '8': false,
    '9': false,
    '10': false,
    '11': false,
    '12': false,
    '13': false,
    '14': false,
    '15': false,
    '16': false,
    '17': false,
    '18': false,
    '19': false,
    '20': false,
    '21': false,
    '22': false,
    '23': false,
    '24': false,
    '25': false,
    '26': false,
    '27': false,
    '28': false,
    '29': false,
    '30': false,
    '30 ve üzeri': false,
  };

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Kat Sayısını Seçin'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: _floorOptions.keys.map((String key) {
            return CheckboxListTile(
              title: Text(key),
              value: _floorOptions[key],
              onChanged: (bool? value) {
                setState(() {
                  _floorOptions[key] = value ?? false;
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
            final selectedOptions = _floorOptions.entries
                .where((entry) => entry.value)
                .map((entry) => entry.key)
                .toList();
            context.read<AdBloc>().addAdUpdateFloorFilterEvent(selectedOptions);
            Navigator.of(context).pop();
          },
          child: const Text('Tamam'),
        ),
      ],
    );
  }
}
