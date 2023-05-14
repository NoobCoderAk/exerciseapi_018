import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kategori_app/controller/kategori_barang_controller.dart';
import 'package:kategori_app/model/kategori_barang_model.dart';

class KategoriBarang extends StatefulWidget {
  const KategoriBarang({super.key});

  @override
  State<KategoriBarang> createState() => _KategoriBarangState();
}

class _KategoriBarangState extends State<KategoriBarang> {
  // membuat object kategoriBarangController dari class kategoriBarangController()
  final kategoriBarangController = KategoriBarangController();
  // membuat List listKategoriBarang dari class KategoriBarangModel
  List<KategoriBarangModel> listKategoriBarang = [];
  // membuat variable nama tipe String
  String? nama;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getKategoriBarang();
  }

  void getKategoriBarang() async {
    final KategoriBarang = await kategoriBarangController.getKategoriBarang();
    setState(() {
      listKategoriBarang = KategoriBarang;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
