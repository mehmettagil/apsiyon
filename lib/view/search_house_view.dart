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
          children: [
            Row(
              children: [
                Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSF_LDMJcYwdd9_O73matfRxuDQ9j_dWCvlnQ&s")
              ],
            )
          ],
        ));
  }
}
