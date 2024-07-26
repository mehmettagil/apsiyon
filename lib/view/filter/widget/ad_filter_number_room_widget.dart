import 'package:apsiyon/app_bloc/ad_bloc/ad_bloc.dart';
import 'package:apsiyon/core/init/extension/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdFilterRoomWidget extends StatefulWidget {
  const AdFilterRoomWidget({super.key});

  @override
  _AdFilterRoomWidgetState createState() => _AdFilterRoomWidgetState();
}

class _AdFilterRoomWidgetState extends State<AdFilterRoomWidget> {
  final Map<String, bool> _roomOptions = {
    '1+0': false,
    '1+1': false,
    '2+1': false,
    '2+2': false,
    '3+1': false,
    '3+2': false,
    '4+1': false,
    '4+2': false,
    '4+3': false,
    '4+4': false,
    '5+1': false,
  };

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Oda Sayısını Seçin'),
      content: SingleChildScrollView(
        child: SizedBox(
          width: context.width * 0.8,
          height: context.height * 0.8,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: _roomOptions.keys.map((String key) {
              return CheckboxListTile(
                title: Text(key),
                value: _roomOptions[key],
                onChanged: (bool? value) {
                  setState(() {
                    _roomOptions[key] = value ?? false;
                  });
                },
              );
            }).toList(),
          ),
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
            // Seçilen oda seçeneklerini işleyin veya kullanın
            final selectedOptions = _roomOptions.entries
                .where((entry) => entry.value)
                .map((entry) => entry.key)
                .toList();
                 context
                .read<AdBloc>()
                .add(AdUpdateRoomFilterEvent(selectedOptions));
          Navigator.of(context).pop();
          },
          child: const Text('Tamam'),
        ),
      ],
    );
  }
}
