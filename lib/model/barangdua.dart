// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class BarangDua {
  final String nama;
  BarangDua({
    required this.nama,
  });

  BarangDua copyWith({
    String? nama,
  }) {
    return BarangDua(
      nama: nama ?? this.nama,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nama': nama,
    };
  }

  factory BarangDua.fromMap(Map<String, dynamic> map) {
    return BarangDua(
      nama: map['nama'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BarangDua.fromJson(String source) =>
      BarangDua.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'BarangDua(nama: $nama)';

  @override
  bool operator ==(covariant BarangDua other) {
    if (identical(this, other)) return true;

    return other.nama == nama;
  }

  @override
  int get hashCode => nama.hashCode;
}
