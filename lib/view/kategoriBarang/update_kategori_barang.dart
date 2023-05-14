import 'package:flutter/material.dart';
import 'package:kategori_app/controller/kategori_barang_controller.dart';
import 'package:kategori_app/view/kategoriBarang/kategori_barang.dart';

class UpdateKategoriBarang extends StatefulWidget {
  final int? id;
  final String? nama;
  const UpdateKategoriBarang({
    Key? key,
    this.nama,
    this.id,
  }) : super(key: key);

  @override
  State<UpdateKategoriBarang> createState() => _UpdateKategoriBarangState();
}

class _UpdateKategoriBarangState extends State<UpdateKategoriBarang> {
  //membuat object kategoriBarangController dari class KategoriBarangController()
  final kategoriBarangController = KategoriBarangController();
  //membuat variable nama tipe string
  String? nama;

  void updateKategoriBarang(int id, String nama) async {
    await kategoriBarangController.updateKategoriBarang(id, nama);
  }

  @override
  Widget build(BuildContext context) {
    var formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Kategori Barang'),
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
              initialValue: widget.nama,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Nama Kategori is required';
                }
                return null;
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  kategoriBarangController.updateKategoriBarang(
                      widget.id!, nama!);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const KategoriBarang(),
                    ),
                  );

                  var snackBar = const SnackBar(
                    content: Text('Data Berhasil Diubah'),
                  );
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
