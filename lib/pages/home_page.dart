import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference _tabungan = FirebaseFirestore.instance.collection(
    'tabungan',
  );

  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _jumlahController = TextEditingController();
  final TextEditingController _keteranganController = TextEditingController();

  Future<void> _tampilkanDialog({DocumentSnapshot? doc}) async {
    if (doc != null) {
      _namaController.text = doc['nama'];
      _jumlahController.text = doc['jumlah'].toString();
      _keteranganController.text = doc['keterangan'];
    } else {
      _namaController.clear();
      _jumlahController.clear();
      _keteranganController.clear();
    }

    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            title: Text(doc == null ? 'Tambah Tabungan' : 'Edit Tabungan'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _namaController,
                  decoration: const InputDecoration(labelText: 'Nama'),
                ),
                TextField(
                  controller: _jumlahController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(labelText: 'Jumlah'),
                ),
                TextField(
                  controller: _keteranganController,
                  decoration: const InputDecoration(labelText: 'Keterangan'),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Batal'),
              ),
              ElevatedButton(
                onPressed: () async {
                  final String nama = _namaController.text;
                  final int jumlah = int.tryParse(_jumlahController.text) ?? 0;
                  final String keterangan = _keteranganController.text;

                  if (doc == null) {
                    await _tabungan.add({
                      'nama': nama,
                      'jumlah': jumlah,
                      'keterangan': keterangan,
                    });
                  } else {
                    await _tabungan.doc(doc.id).update({
                      'nama': nama,
                      'jumlah': jumlah,
                      'keterangan': keterangan,
                    });
                  }

                  Navigator.pop(context);
                },
                child: const Text('Simpan'),
              ),
            ],
          ),
    );
  }

  Future<void> _hapusData(String id) async {
    await _tabungan.doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('jBank')),
      body: StreamBuilder<QuerySnapshot>(
        stream: _tabungan.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final docs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (_, index) {
                final doc = docs[index];
                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  child: ListTile(
                    title: Text(doc['nama']),
                    subtitle: Text('Rp${doc['jumlah']} - ${doc['keterangan']}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () => _tampilkanDialog(doc: doc),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () => _hapusData(doc.id),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _tampilkanDialog(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
