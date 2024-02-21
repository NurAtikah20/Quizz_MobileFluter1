import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hitung Rata-rata Nilai', // Judul aplikasi
      theme: ThemeData(
        primarySwatch: Colors.red, // Tema aplikasi
      ),
      home: const MyHomePage(), // Halaman utama aplikasi
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() =>
      _MyHomePageState(); // Perhatikan bahwa kelas _MyHomePageState tidak dinyatakan sebagai private.
}

class _MyHomePageState extends State<MyHomePage> {
  // Controller untuk nilai masing-masing mata pelajaran
  TextEditingController nilaiWplController = TextEditingController();
  TextEditingController bobotWplController = TextEditingController();
  TextEditingController nilaiPdasarController = TextEditingController();
  TextEditingController bobotPdasarController = TextEditingController();
  TextEditingController nilaiKwuController = TextEditingController();
  TextEditingController bobotKwuController = TextEditingController();

  // Variabel untuk menyimpan nilai masing-masing mata pelajaran dan rata-rata
  double nilaiWpl = 0.0;
  double nilaiPdasar = 0.0;
  double nilaiKwu = 0.0;
  double rataRata = 0.0;

  // Bobot untuk setiap mata pelajaran
  double bobotWpl = 0.0;
  double bobotPdasar = 0.0;
  double bobotKwu = 0.0;

  // Fungsi untuk menghitung rata-rata
  void _hitungRataRata() {
    setState(() {
      nilaiWpl = double.tryParse(nilaiWplController.text) ?? 0.0;
      bobotWpl = double.tryParse(bobotWplController.text) ?? 0.0;
      nilaiPdasar = double.tryParse(nilaiPdasarController.text) ?? 0.0;
      bobotPdasar = double.tryParse(bobotPdasarController.text) ?? 0.0;
      nilaiKwu = double.tryParse(nilaiKwuController.text) ?? 0.0;
      bobotKwu = double.tryParse(bobotKwuController.text) ?? 0.0;

      // Menghitung rata-rata berdasarkan bobot
      double totalBobot = bobotWpl + bobotPdasar + bobotKwu;
      if (totalBobot > 0) {
        rataRata = (nilaiWpl * bobotWpl +
                nilaiPdasar * bobotPdasar +
                nilaiKwu * bobotKwu) /
            totalBobot;
      } else {
        rataRata = 0.0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hitung Rata-rata Nilai'), // Judul halaman
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            // Input untuk nilai masing-masing mata pelajaran
            TextField(
              controller: nilaiWplController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nilai Workshop Kuliatas Perangkat Lunak',
              ),
            ),
            const SizedBox(height: 12.0),
            // Input untuk bobot masing-masing mata pelajaran
            TextField(
              controller: bobotWplController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Bobot Workshop Kuliatas Perangkat Lunak',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: nilaiPdasarController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nilai Pemrograman Dasar',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: bobotPdasarController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Bobot Pemrograman Dasar',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: nilaiKwuController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Nilai Kewirausahaan',
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: bobotKwuController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Bobot Kewirausahaan',
              ),
            ),
            const SizedBox(height: 24.0),
            // Tombol untuk menghitung rata-rata
            ElevatedButton(
              onPressed: _hitungRataRata,
              child: const Text('Hitung Rata-rata'),
            ),
            const SizedBox(height: 24.0),
            // Menampilkan hasil rata-rata
            Text(
              'Rata-rata Nilai: $rataRata',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
