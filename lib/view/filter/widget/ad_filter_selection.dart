import 'package:apsiyon/app_bloc/ad_bloc/ad_bloc.dart';
import 'package:apsiyon/core/enum/ad_filter_type.dart';
import 'package:apsiyon/view/filter/widget/ad_filter_building_age_widget.dart';
import 'package:apsiyon/view/filter/widget/ad_filter_foor_widget.dart';
import 'package:apsiyon/view/filter/widget/ad_filter_m2_widget.dart';
import 'package:apsiyon/view/filter/widget/ad_filter_number_room_widget.dart';
import 'package:apsiyon/view/filter/widget/ad_filter_price_widget.dart';
import 'package:apsiyon/view/filter/widget/search_near_nw_widget.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AdFilterSelection extends StatelessWidget {
  const AdFilterSelection({
    required this.title,
    required this.subtitle,
    required this.type,
    super.key,
  });

  final String title;
  final String subtitle;
  final AdFilterType type;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            switch (type) {
              case AdFilterType.searchNearMe:
                return const SearchNearNewWidget();
              case AdFilterType.price:
                return const AdFilterPriceWidget();
              case AdFilterType.m2:
                return const AdFilterM2Widget();
              case AdFilterType.numberRooms:
                return const AdFilterRoomWidget();
              case AdFilterType.buildingAge:
                return const AdFilterBuildingAgeWidget();
              case AdFilterType.floor:
                return const AdFilterFloorWidget();

              default:
            }
            return const SearchNearNewWidget();
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 5),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20),
                ),
                BlocBuilder<AdBloc, AdState>(
                  builder: (context, state) {
                    String newSubtitle = "Tümü";
                    switch (type) {
                      case AdFilterType.searchNearMe:
                        newSubtitle = state.distance == 0
                            ? "Tümü"
                            : "${state.distance.toStringAsFixed(1)} km";
                      case AdFilterType.price:
                        newSubtitle = state.maxPrice == 0
                            ? "Tümü"
                            : ("${state.minPrice}-${state.maxPrice}");
                      case AdFilterType.m2:
                        newSubtitle = state.maxM2 == 0
                            ? "Tümü"
                            : ("${state.minM2}-${state.maxM2}");
                      case AdFilterType.numberRooms:
                        newSubtitle = state.selectedRoomTypes.isEmpty
                            ? "Tümü"
                            : state.selectedRoomTypes.join(", ");
                      case AdFilterType.buildingAge:
                        newSubtitle = state.selectedBuildingAges.isEmpty
                            ? "Tümü"
                            : state.selectedBuildingAges.join(", ");
                      case AdFilterType.floor:
                        newSubtitle = state.selectedFloorCounts.isEmpty
                            ? "Tümü"
                            : state.selectedFloorCounts.join(", ");

                        break;
                      default:
                    }
                    return Text(
                      newSubtitle,
                      style: const TextStyle(fontSize: 18, color: Colors.grey),
                    );
                  },
                ),
              ],
            ),
            const Spacer(),
            const Text(
              "...",
              style: TextStyle(fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
