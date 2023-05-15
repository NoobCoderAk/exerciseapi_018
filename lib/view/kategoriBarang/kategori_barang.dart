import 'package:flutter/material.dart';
import 'package:kategori_app/controller/kategori_barang_controller.dart';
import 'package:kategori_app/model/kategori_barang_model.dart';
import 'package:kategori_app/view/kategoriBarang/add_kategori_barang.dart';
import 'package:kategori_app/view/kategoriBarang/update_kategori_barang.dart';

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
    super.initState();
    getKategoriBarang();
  }

  // method untuk get data kategori barang
  void getKategoriBarang() async {
    // ignore: non_constant_identifier_names
    final KategoriBarang = await kategoriBarangController.getKategoriBarang();
    setState(() {
      listKategoriBarang = KategoriBarang;
    });
  }

  // method untuk delete kategori barang
  void deleteKategoriBarang(int id) async {
    await kategoriBarangController.deleteKategoriBarang(id);
  }

  // UI Kategori barang
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori Barang'),
      ),
      body: SafeArea(
          child: ListView.builder(
        itemCount: listKategoriBarang.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(listKategoriBarang[index].nama),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UpdateKategoriBarang(
                            id: listKategoriBarang[index].id,
                            nama: listKategoriBarang[index].nama,
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                      onPressed: () {
                        deleteKategoriBarang(listKategoriBarang[index].id);
                        setState(() {
                          listKategoriBarang.removeAt(index);
                        });
                      },
                      icon: const Icon(Icons.delete))
                ],
              ),
            ),
          );
        },
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddKategoriBarang()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
