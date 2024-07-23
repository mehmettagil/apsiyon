import 'package:flutter/material.dart';

class HouseAdView extends StatelessWidget {
  const HouseAdView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('İlanlar'),
        ),
        body: Column(
          children: const [
            Center(
              child: Text(
                'House Ad',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ));
  }
}
