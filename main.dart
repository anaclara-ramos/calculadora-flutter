import 'package:flutter/material.dart';

void main() {
  runApp(Calculadora());
}

class Calculadora extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculadoraPage(),
      debugShowCheckedModeBanner: false,
    );
  }
} 

class CalculadoraPage extends StatefulWidget {
  _CalculadoraPageState createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  TextEditingController num1 = TextEditingController();
  TextEditingController num2 = TextEditingController();

  double resultado = 0;

  void calcular(String operacao) {
    double n1 = double.tryParse(num1.text) ?? 0;
    double n2 = double.tryParse(num2.text) ?? 0;

    setState(() {
      if (operacao == '+') {
        resultado = n1 + n2;
      } else if (operacao == '-') {
        resultado = n1 - n2;
      } else if (operacao == '*') {
        resultado = n1 * n2;
      } else if (operacao == '/') {
        resultado = n2 != 0 ? n1 / n2 : 0;
      }
    });
  }

  Widget botao(String texto) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
          //backgroundColor: Colors.pink.shade100,
          ),
          onPressed: () => calcular(texto),
          child: Text(texto, style: TextStyle(fontSize: 30)),   
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("Calculadora"),
      centerTitle: true,
      backgroundColor: Colors.pink.shade100,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: num1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Insira o primeiro número"),
            ),
            TextField(
              controller: num2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Insira o segundo número"),
            ),
            SizedBox(height: 20),

            Row(
              children: [
                botao('+'),
                botao('-'),
                botao('*'),
                botao('/'),
              ],
            ),

            SizedBox(height: 35),

            Text(
              "Resultado: $resultado",
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
