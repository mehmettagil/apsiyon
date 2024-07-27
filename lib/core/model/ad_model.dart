// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class AdModel extends Equatable {
  final String adNo;
  final String siteName;
  final String description;
  final int price;
  final String imageUrl;
  final bool isLiked;
  final double distance;
  final double m2;
  final String roomCount;
  final String buildingAge;
  final String floorCount;
  const AdModel({
    required this.adNo,
    required this.siteName,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isLiked,
    required this.distance,
    required this.m2,
    required this.roomCount,
    required this.buildingAge,
    required this.floorCount,
  });

  AdModel copyWith({
    String? adNo,
    String? siteName,
    String? description,
    int? price,
    String? imageUrl,
    bool? isLiked,
    double? distance,
    double? m2,
    String? roomCount,
    String? buildingAge,
    String? floorCount,
  }) {
    return AdModel(
      adNo: adNo ?? this.adNo,
      siteName: siteName ?? this.siteName,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isLiked: isLiked ?? this.isLiked,
      distance: distance ?? this.distance,
      m2: m2 ?? this.m2,
      roomCount: roomCount ?? this.roomCount,
      buildingAge: buildingAge ?? this.buildingAge,
      floorCount: floorCount ?? this.floorCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adNo': adNo,
      'site_name': siteName,
      'description': description,
      'price': price,
      'image_url': imageUrl,
      'is_liked': isLiked,
      'distance': distance,
      'm2': m2,
      'room_count': roomCount,
      'building_age': buildingAge,
      'floor_count': floorCount,
    };
  }

  factory AdModel.fromMap(Map<dynamic, dynamic> map) {
    return AdModel(
      adNo: map['adNo'] as String,
      siteName: map['site_name'] as String,
      description: map['description'] as String,
      price: map['price'] as int,
      imageUrl: map['image_url'] as String,
      isLiked: map['is_liked'] as bool,
      distance: map['distance'] as double,
      m2: map['m2'] as double,
      roomCount: map['room_count'] as String,
      buildingAge: map['building_age'] as String,
      floorCount: map['floor_count'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdModel.fromJson(String source) =>
      AdModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      adNo,
      siteName,
      description,
      price,
      imageUrl,
      isLiked,
      distance,
      m2,
      roomCount,
      buildingAge,
      floorCount,
    ];
  }
}
