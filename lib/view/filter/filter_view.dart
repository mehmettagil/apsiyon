import 'package:apsiyon/app_bloc/ad_bloc/ad_bloc.dart';
import 'package:apsiyon/core/enum/ad_filter_type.dart';
import 'package:apsiyon/core/init/extension/context_extensions.dart';
import 'package:apsiyon/view/advert_screen.dart';
import 'package:apsiyon/view/filter/widget/ad_filter_Selection.dart';
import 'package:apsiyon/view/house_ad/house_ad_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterView extends StatelessWidget {
  const FilterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtreleme'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.filter_alt),
            label: 'İlan Ara',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'İlan Oluştur',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FilterView();
            }));
          } else {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AdvertScreen(
              );
            }));
          }
        },
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: AdFilterType.values.length,
            itemBuilder: (context, index) {
              final filter = AdFilterType.values[index];
              return BlocBuilder<AdBloc, AdState>(
                builder: (context, state) {
                  return AdFilterSelection(
                    title: filter.fromStringTitle(),
                    subtitle: filter.fromStringSubtitle(),
                    type: filter,
                  );
                },
              );
            },
          ),
          Positioned(
            left: context.width * 0.05,
            bottom: context.height * 0.05,
            width: context.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const AdView();
                  }));
                },
                child: Container(
                  width: context.width,
                  decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Sonuçları Litesle",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
