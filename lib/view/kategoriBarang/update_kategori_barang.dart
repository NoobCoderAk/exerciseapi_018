import 'package:flutter/material.dart';
import 'package:kategori_app/controller/kategori_barang_controller.dart';
import 'package:kategori_app/model/kategori_barang_model.dart';
import 'package:kategori_app/view/kategoriBarang/kategori_barang.dart';

class UpdateKategoriBarang extends StatefulWidget {
  const UpdateKategoriBarang({super.key});

  @override
  State<UpdateKategoriBarang> createState() => _UpdateKategoriBarangState();
}

class _UpdateKategoriBarangState extends State<UpdateKategoriBarang> {
  //membuat object kategoriBarangController dari class KategoriBarangController()
  final kategoriBarangController = KategoriBarangController();
  //membuat variable nama tipe string
  String? nama;

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Kategori Barang'),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.all(17.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Nama Kategori Barang',
                hintText: 'Nama Kategori Barang',
              ),
              onChanged: (value) {},
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama Kategori diperlukan';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KategoriBarang(),
                    ),
                  );
                }
              },
              child: const Text('simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
