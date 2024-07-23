import 'package:flutter/material.dart';

class SearchHouseView extends StatelessWidget {
  const SearchHouseView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('İlan Ara'),
      ),
      body: Column(
        children: const [
          Center(
            child: Text(
              'Search House',
              style: TextStyle(fontSize: 24),
            ),
          ),
        ],
      )
    );
  }
}
