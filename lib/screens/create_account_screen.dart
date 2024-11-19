import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Criar Conta',
          style: TextStyle(shadows: [
            Shadow(
              blurRadius: 5.0,
              color: Colors.grey,
              offset: Offset(2.0, 2.0),
            ),
          ]),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, shadows: [
            Shadow(
              blurRadius: 5.0,
              color: Colors.grey,
              offset: Offset(2.0, 2.0),
            ),
          ]),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Spacer(), // Adiciona espaço flexível acima
            TextField(
              decoration: InputDecoration(
                labelText: 'Nome',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'CPF',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Telefone',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Senha',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirmar Senha',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Cor azul
                  minimumSize: Size(double.infinity, 50), // Aumenta o tamanho horizontal
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Aumenta o tamanho da fonte e negrito
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  elevation: 5, // Adiciona elevação para sombra
                  shadowColor: Colors.black.withOpacity(0.5), // Cor da sombra
                ),
                child: Text(
                  'Criar Conta',
                  style: TextStyle(color: Colors.white), // Cor branca
                ),
              ),
            ),
            Spacer(flex: 2), // Adiciona mais espaço flexível abaixo
          ],
        ),
      ),
    );
  }
}