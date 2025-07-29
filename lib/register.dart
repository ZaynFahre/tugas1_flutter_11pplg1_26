import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  String? selectedGender;
  DateTime? selectedDate;

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Register")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Buat Akun Baru", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),

            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Nama",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email / Username",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: "Jenis Kelamin",
                border: OutlineInputBorder(),
              ),
              value: selectedGender,
              items: ['Laki-laki', 'Perempuan']
                  .map((gender) => DropdownMenuItem(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),

            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    selectedDate == null
                        ? "Tanggal Lahir belum dipilih"
                        : "Tanggal Lahir: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
                  ),
                ),
                TextButton(
                  onPressed: () => _pickDate(context),
                  child: const Text("Pilih Tanggal"),
                ),
              ],
            ),

            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Simpan atau kirim data register di sini
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Registrasi berhasil!')),
                  );
                  Navigator.pop(context); // kembali ke halaman login
                },
                child: const Text("Daftar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}