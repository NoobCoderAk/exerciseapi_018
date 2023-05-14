import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kategori_app/controller/kategori_barang_controller.dart';
import 'package:kategori_app/model/kategori_barang_model.dart';

class AddKategoriBarang extends StatefulWidget {
  const AddKategoriBarang({super.key});

  @override
  State<AddKategoriBarang> createState() => _AddKategoriBarangState();
}

class _AddKategoriBarangState extends State<AddKategoriBarang> {
  //membuat object kategoriBarangController dari class KategoriBarangController()
  final kategoriBarangController = KategoriBarangController();
  //membuat variable nama tipe string
  String? nama;

  void addKategoriBarang() async {
    //membuat object kategoriBarangModel dari class KategoriBarangModel()
    KategoriBarangModel kategoriBarangModel = KategoriBarangModel(nama: nama!);
    await kategoriBarangController.addKategoriBarang(kategoriBarangModel);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
