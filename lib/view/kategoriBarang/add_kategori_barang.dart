import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kategori_app/controller/kategori_barang_controller.dart';

class AddKategoriBarang extends StatefulWidget {
  const AddKategoriBarang({super.key});

  @override
  State<AddKategoriBarang> createState() => _AddKategoriBarangState();
}

class _AddKategoriBarangState extends State<AddKategoriBarang> {
  //membuta object kategoriBarangController dari class KategoriBarangController()
  final kategoriBarangController = KategoriBarangController();
  String? nama;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
