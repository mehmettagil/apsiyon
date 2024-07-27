import 'package:flutter/foundation.dart';

class UserListModel {
  final String peopleImage;
  final String name;
  final String surname;
  final String adNo;
  final String adDate;
  final bool isReference;
  final String username;
  final String email;
  final String password;  // Yeni eklenen alan

  const UserListModel({
    required this.peopleImage,
    required this.name,
    required this.surname,
    required this.adNo,
    required this.adDate,
    required this.isReference,
    required this.username,
    required this.email,
    required this.password,  // Zorunlu alan olarak ekleniyor
  });
}
