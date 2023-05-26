import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CampoTexto extends StatefulWidget {
  @override
  _CampoTextoState createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController _precoalcool = TextEditingController();
  TextEditingController _precogasolina = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Álcool ou Gasolina")),
        body: Container(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(30),
            child: Center(
                child: Column(
              children: [
                Image.asset("images/logo.png"),
                Container(height: 30),
                Text(
                  "Saiba qual a melhor opção para abastecimento do seu carro",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Container(height: 5),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Álcool, ex: 1.59"),
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  controller: _precoalcool,
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration:
                      InputDecoration(labelText: "Preço Gasolina, ex: 3.15"),
                  style: TextStyle(fontSize: 20, color: Colors.black),
                  controller: _precogasolina,
                ),
                Container(height: 10),
                ElevatedButton(
                  child: Text(
                    "Calcular",
                    style: TextStyle(fontSize: 30),
                  ),
                  style: ElevatedButton.styleFrom(minimumSize: Size(350, 50)),
                  onPressed: () {
                    double? alcool = double.tryParse(_precoalcool.text);
                    double? gasolina = double.tryParse(_precogasolina.text);
                    try {
                      if ((alcool! / gasolina!) >= 0.7) {
                        print("Vale a pena utilizar a Gasolina");
                      } else {
                        print("Vale a pena utilizar o Alcool");
                      }
                    } catch (e) {
                      print("Um erro ocorreu");
                    }
                  },
                )
              ],
            )),
          ),
        ));
  }
}
