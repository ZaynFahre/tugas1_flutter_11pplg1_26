import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Sederhana',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  String _selectedOperator = '+';
  double? _result;

  void _calculate() {
    final double? num1 = double.tryParse(_controller1.text);
    final double? num2 = double.tryParse(_controller2.text);

    if (num1 == null || num2 == null) {
      _showSnackBar("Masukkan angka yang valid!");
      return;
    }

    double tempResult;

    switch (_selectedOperator) {
      case '+':
        tempResult = num1 + num2;
        break;
      case '-':
        tempResult = num1 - num2;
        break;
      case '*':
        tempResult = num1 * num2;
        break;
      case '/':
        if (num2 == 0) {
          _showSnackBar("Tidak bisa membagi dengan nol!");
          return;
        }
        tempResult = num1 / num2;
        break;
      default:
        _showSnackBar("Operator tidak valid");
        return;
    }

    setState(() {
      _result = tempResult;
    });
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message), duration: const Duration(seconds: 2)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kalkulator Sederhana")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Angka pertama"),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Angka kedua"),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ['+', '-', '*', '/'].map((op) {
                return Row(
                  children: [
                    Radio<String>(
                      value: op,
                      groupValue: _selectedOperator,
                      onChanged: (value) {
                        setState(() {
                          _selectedOperator = value!;
                        });
                      },
                    ),
                    Text(op),
                  ],
                );
              }).toList(),
            ),
            ElevatedButton(
              onPressed: _calculate,
              child: const Text("Hitung"),
            ),
            const SizedBox(height: 20),
            if (_result != null)
              Text(
                "Hasil: $_result",
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
          ],
        ),
      ),
    );
  }
}