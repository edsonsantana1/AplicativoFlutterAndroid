import 'package:flutter/material.dart';

class CartaoCreditoPage extends StatefulWidget {
  const CartaoCreditoPage({super.key});

  @override
  _CartaoCreditoPageState createState() => _CartaoCreditoPageState();
}

class _CartaoCreditoPageState extends State<CartaoCreditoPage> {
  final _formKey = GlobalKey<FormState>();
  final _cardNumberController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _cvvController = TextEditingController();
  final _cardHolderNameController = TextEditingController();
  double _fontSize = 16.0; // Ajuste o tamanho da fonte aqui
  double _buttonFontSize = 20.0; // Ajuste o tamanho da fonte do botão aqui

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    _cardHolderNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamento com Cartão de Crédito'),
      ),
      body: Container(
        color: Colors.grey[100], // Fundo cinza claro
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text(
                'Insira os detalhes do cartão',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _cardNumberController,
                decoration: InputDecoration(
                  labelText: 'Número do Cartão',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // Bordas arredondadas
                  ),
                  filled: true,
                  fillColor: Colors.white, // Campo em branco
                  errorStyle: const TextStyle(color: Colors.black), // Texto de erro em preto
                ),
                keyboardType: TextInputType.number,
                style: TextStyle(fontSize: _fontSize, color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o número do cartão';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _expiryDateController,
                      decoration: InputDecoration(
                        labelText: 'Validade (MM/AA)',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0), // Bordas arredondadas
                        ),
                        filled: true,
                        fillColor: Colors.white, // Campo em branco
                        errorStyle: const TextStyle(color: Colors.black), // Texto de erro em preto
                      ),
                      keyboardType: TextInputType.datetime,
                      style: TextStyle(fontSize: _fontSize, color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a validade';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: TextFormField(
                      controller: _cvvController,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0), // Bordas arredondadas
                        ),
                        filled: true,
                        fillColor: Colors.white, // Campo em branco
                        errorStyle: const TextStyle(color: Colors.black), // Texto de erro em preto
                      ),
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize: _fontSize, color: Colors.black),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o CVV';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _cardHolderNameController,
                decoration: InputDecoration(
                  labelText: 'Nome do Titular',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0), // Bordas arredondadas
                  ),
                  filled: true,
                  fillColor: Colors.white, // Campo em branco
                  errorStyle: const TextStyle(color: Colors.black), // Texto de erro em preto
                ),
                style: TextStyle(fontSize: _fontSize, color: Colors.black),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome do titular';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Processar pagamento
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Processando pagamento...')),
                      );
                      setState(() {
                        _cardNumberController.text = '';
                        _expiryDateController.text = '';
                        _cvvController.text = '';
                        _cardHolderNameController.text = '';
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Cor do botão
                    minimumSize: const Size(200, 50), // Tamanho do botão ajustado
                  ),
                  child: Text(
                    'Pagar',
                    style: TextStyle(color: Colors.white, fontSize: _buttonFontSize), // Texto em branco com tamanho ajustável
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}