import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AdFilterType {
  searchNearMe("search_near_me"),
  price("price"),
  m2("m2"),
  numberRooms("number_rooms"),
  buildingAge("building_age"),
  floor("floor");

  const AdFilterType(this.value);

  final String value;

  String fromStringTitle() {
    switch (this) {
      case AdFilterType.searchNearMe:
        return "Yakınımda Ara";
      case AdFilterType.price:
        return "Fiyat";
      case AdFilterType.m2:
        return "m2";
      case AdFilterType.numberRooms:
        return "Oda Sayısı";
      case AdFilterType.buildingAge:
        return "Bina Yaşı";
      case AdFilterType.floor:
        return "Bulunduğu Kat";

      default:
        return "";
    }
  }

  String fromStringSubtitle() {
    switch (this) {
      case AdFilterType.searchNearMe:
        return "Kapalı - Tüm Mesafeler";
      case AdFilterType.price:
        return "Tümü";
      case AdFilterType.m2:
        return "Tümü";
      case AdFilterType.numberRooms:
        return "Tümü";
      case AdFilterType.buildingAge:
        return "Tümü";
      case AdFilterType.floor:
        return "Tümü";
      default:
        return "Tümü";
    }
  }
}
