// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class AdModel extends Equatable {
  final String adNo;
  final String siteName;
  final String description;
  final String price;
  final String imageUrl;
  final bool isLiked;
  const AdModel({
    required this.adNo,
    required this.siteName,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.isLiked
  });

  AdModel copyWith({
    String? adNo,
    String? siteName,
    String? description,
    String? price,
    String? imageUrl,
    bool? isLiked
  }) {
    return AdModel(
      adNo: adNo ?? this.adNo,
      siteName: siteName ?? this.siteName,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      isLiked: isLiked ?? this.isLiked
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'adNo': adNo,
      'siteName': siteName,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'isLiked': isLiked
    };
  }

  factory AdModel.fromMap(Map<String, dynamic> map) {
    return AdModel(
      adNo: map['adNo'] as String,
      siteName: map['siteName'] as String,
      description: map['description'] as String,
      price: map['price'] as String,
      imageUrl: map['imageUrl'] as String,
      isLiked: map['isLiked'] as bool
    );
  }

  String toJson() => json.encode(toMap());

  factory AdModel.fromJson(String source) =>
      AdModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [
        adNo,
        siteName,
        description,
        price,
        imageUrl,
        isLiked
      ];
}
