import 'package:apsiyon/app_bloc/ad_bloc/ad_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchNearNewWidget extends StatelessWidget {
  const SearchNearNewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    double distance = 1.0;

    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(
          title: const Text('Yakınımda Ara'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.home, size: 40, color: Colors.blue),
                    Expanded(
                      child: Slider(
                        value: distance,
                        min: 0.1,
                        max: 10.0,
                        divisions: 100,
                        label: distance == 10.0
                            ? 'Tüm Mesafeler'
                            : '${distance.toStringAsFixed(1)} km',
                        onChanged: (double value) {
                          setState(() {
                            distance = value;
                          });
                        },
                      ),
                    ),
                    const Icon(Icons.location_on, size: 40, color: Colors.red),
                  ],
                ),
                Text(
                  distance == 10.0
                      ? 'Tüm Mesafeler'
                      : '${distance.toStringAsFixed(1)} km',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                context.read<AdBloc>().add(AdUpdateNearFilterEvent(distance));

                Navigator.of(context).pop();
              },
              child: const Text('Tamam'),
            ),
          ],
        );
      },
    );
  }
}
