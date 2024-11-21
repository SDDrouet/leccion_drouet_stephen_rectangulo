import 'package:flutter/material.dart';
import 'package:leccion_drouet_stephen_rectangulo/controller/Rectangulo.dart';

class RectanguloUI extends StatefulWidget {
  @override
  @override
  _RectanguloUIState createState() => _RectanguloUIState();
}

class _RectanguloUIState extends State<RectanguloUI> {
  final TextEditingController baseController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  String resultado = "";
  String seleccion = 'Área';

  final List<String> opciones = ['Área', 'Perímetro'];

  void calcularResultado() {
    double base = double.tryParse(baseController.text) ?? 0;
    double altura = double.tryParse(alturaController.text) ?? 0;

    if (altura > 0 && base > 0) {
      Rectangulo rectangulo = Rectangulo(base, altura);

      setState(() {
        if (seleccion == 'Área') {
          resultado = "Área: ${rectangulo.calcularArea()}";
        } else if (seleccion == 'Perímetro') {
          resultado = "Perímetro: ${rectangulo.calcularPerimetro()}";
        }
      });
    } else {
      resultado = "Valores no validos, deben ser mayor a 0";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rectángulo UI'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: baseController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Base',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Altura',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            DropdownButton<String>(
              value: seleccion,
              onChanged: (String? newValue) {
                setState(() {
                  seleccion = newValue!;
                });
              },
              items: opciones.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calcularResultado,
              child: Text('Calcular'),
            ),
            SizedBox(height: 20),
            Text(
              resultado,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
