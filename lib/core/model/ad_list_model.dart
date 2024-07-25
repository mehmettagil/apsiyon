// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class AdListModel extends Equatable {
  final String peopleImage;
  final String name;
  final String surname;
  final String adNo;
  final String adDate;
  final bool isReference;
  const AdListModel({
    required this.peopleImage,
    required this.name,
    required this.surname,
    required this.adNo,
    required this.adDate,
    required this.isReference,
  });

  AdListModel copyWith({
    String? peopleImage,
    String? name,
    String? surname,
    String? adNo,
    String? adDate,
    bool? isReference,
  }) {
    return AdListModel(
      peopleImage: peopleImage ?? this.peopleImage,
      name: name ?? this.name,
      surname: surname ?? this.surname,
      adNo: adNo ?? this.adNo,
      adDate: adDate ?? this.adDate,
      isReference: isReference ?? this.isReference,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'people_image': peopleImage,
      'name': name,
      'surname': surname,
      'adNo': adNo,
      'ad_date': adDate,
      'is_reference': isReference,
    };
  }

  factory AdListModel.fromMap(Map<String, dynamic> map) {
    return AdListModel(
      peopleImage: map['people_image'] as String,
      name: map['name'] as String,
      surname: map['surname'] as String,
      adNo: map['adNo'] as String,
      adDate: map['ad_date'] as String,
      isReference: map['is_reference'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory AdListModel.fromJson(String source) =>
      AdListModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  @override
  List<Object> get props {
    return [
      name,
      surname,
      adNo,
      adDate,
      isReference,
    ];
  }
}
