import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2), // Adiciona espaço flexível acima
            Text(
              'Redefinir Senha',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.grey,
                    offset: Offset(2.0, 2.0),
                  ),
                ],
              ), // Negrito
              textAlign: TextAlign.center, // Centralizado
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Digite seu Email',
                filled: true,
                fillColor: Colors.grey[200],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Lógica para enviar email para redefinir senha
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
                  'Enviar',
                  style: TextStyle(color: Colors.white), // Cor branca
                ),
              ),
            ),
            Spacer(flex: 3), // Adiciona mais espaço flexível abaixo
          ],
        ),
      ),
    );
  }
}