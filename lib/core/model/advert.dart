// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Advert {
  final String id;
  final String siteAdi;
  final double fiyat;
  final double m2;
  final int odaSayisi;
  final int binaYasi;
  final int bulunduguKat;
  final String kullaniciAdi;
  Advert({
    required this.id,
    required this.siteAdi,
    required this.fiyat,
    required this.m2,
    required this.odaSayisi,
    required this.binaYasi,
    required this.bulunduguKat,
    required this.kullaniciAdi,
  });


  Advert copyWith({
    String? id,
    String? siteAdi,
    double? fiyat,
    double? m2,
    int? odaSayisi,
    int? binaYasi,
    int? bulunduguKat,
    String? kullaniciAdi,
  }) {
    return Advert(
      id: id ?? this.id,
      siteAdi: siteAdi ?? this.siteAdi,
      fiyat: fiyat ?? this.fiyat,
      m2: m2 ?? this.m2,
      odaSayisi: odaSayisi ?? this.odaSayisi,
      binaYasi: binaYasi ?? this.binaYasi,
      bulunduguKat: bulunduguKat ?? this.bulunduguKat,
      kullaniciAdi: kullaniciAdi ?? this.kullaniciAdi,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'siteAdi': siteAdi,
      'fiyat': fiyat,
      'm2': m2,
      'odaSayisi': odaSayisi,
      'binaYasi': binaYasi,
      'bulunduguKat': bulunduguKat,
      'kullaniciAdi': kullaniciAdi,
    };
  }

  factory Advert.fromMap(Map<String, dynamic> map) {
    return Advert(
      id: map['id'] as String,
      siteAdi: map['siteAdi'] as String,
      fiyat: map['fiyat'] as double,
      m2: map['m2'] as double,
      odaSayisi: map['odaSayisi'] as int,
      binaYasi: map['binaYasi'] as int,
      bulunduguKat: map['bulunduguKat'] as int,
      kullaniciAdi: map['kullaniciAdi'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Advert.fromJson(String source) => Advert.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Advert(id: $id, siteAdi: $siteAdi, fiyat: $fiyat, m2: $m2, odaSayisi: $odaSayisi, binaYasi: $binaYasi, bulunduguKat: $bulunduguKat, kullaniciAdi: $kullaniciAdi)';
  }

  @override
  bool operator ==(covariant Advert other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.siteAdi == siteAdi &&
      other.fiyat == fiyat &&
      other.m2 == m2 &&
      other.odaSayisi == odaSayisi &&
      other.binaYasi == binaYasi &&
      other.bulunduguKat == bulunduguKat &&
      other.kullaniciAdi == kullaniciAdi;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      siteAdi.hashCode ^
      fiyat.hashCode ^
      m2.hashCode ^
      odaSayisi.hashCode ^
      binaYasi.hashCode ^
      bulunduguKat.hashCode ^
      kullaniciAdi.hashCode;
  }
}
