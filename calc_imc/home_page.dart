import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculadora de IMC",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.underline,
            decorationColor: Colors.white,
            decorationThickness: 2.0,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 40),
              child: Image.asset(
                "images/body.png",
                height: 130,
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              height: 50,
              child: TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  label: const Text(
                    "Digite seu peso:",
                    style: TextStyle(fontSize: 18),
                  ),
                  suffixText: "kg",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45.0)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
              height: 50,
              child: TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 18),
                decoration: InputDecoration(
                  label: const Text(
                    "Digite sua altura:",
                    style: TextStyle(fontSize: 18),
                  ),
                  suffixText: "m",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(45.0)),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              width: 150,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                onPressed: () {
                  double weight = double.parse(_weightController.text);
                  double height = double.parse(_heightController.text);

                  setState(() {
                    _result = calcIMC(weight, height);
                  });
                },
                child: const Text(
                  "Calcular",
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Text(
                _result,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }

  String calcIMC(double weight, double height) {
    double imc = weight / (height * height);

    if (imc <= 18.5) {
      return "Seu imc é de: ${imc.toStringAsFixed(2)}\n\nSua classificacao é: abaixo do peso!";
    } else if (imc > 18.5 && imc < 25) {
      return "Seu imc é de: ${imc.toStringAsFixed(2)}\n\nSua classificacao é: peso ideal (parabéns)";
    } else if (imc >= 25 && imc < 30) {
      return "Seu imc é de: ${imc.toStringAsFixed(2)}\n\nSua classificacao é: levemente acima do peso";
    } else if (imc >= 30 && imc < 35) {
      return "Seu imc é de: ${imc.toStringAsFixed(2)}\n\nSua classificacao é: obesidade grau I";
    } else if (imc >= 35 && imc < 40) {
      return "Seu imc é de: ${imc.toStringAsFixed(2)}\n\nSua classificacao é: obesidade grau II (severa)";
    } else {
      return "Seu imc é de: ${imc.toStringAsFixed(2)}\n\nSua classificacao é: obesidade grau III (mórbida)";
    }
  }
}
