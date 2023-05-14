import 'package:flutter/material.dart';
import 'package:kategori_app/controller/kategori_barang_controller.dart';
import 'package:kategori_app/model/kategori_barang_model.dart';
import 'package:kategori_app/view/kategoriBarang/kategori_barang.dart';
//

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
    var formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Kategori Barang'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const KategoriBarang(),
              ),
            ); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Form(
        key: formkey,
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nama Kategori Barang',
                labelText: 'Nama Kategori Barang',
              ),
              onChanged: (value) {
                nama = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama Kategori harus di isi !';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  addKategoriBarang();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KategoriBarang(),
                    ),
                  );
                  var snackBar =
                      const SnackBar(content: Text('Data Berhasil Disimpan !'));
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              child: const Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
