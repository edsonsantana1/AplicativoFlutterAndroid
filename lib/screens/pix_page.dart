import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Para exibir o QR Code
import 'package:flutter/services.dart'; // Para copiar texto para a área de transferência
import 'my_appointments_page.dart'; // Importar a página de agendamentos

class PixPage extends StatefulWidget {
  final String pixCode =
      "000201010212...52040000530398654041.005802BR5907JOSE DA...6304ABCD"; // Código PIX
  final String orderNumber = "123456"; // Número do pedido

  const PixPage({super.key});

  @override
  _PixPageState createState() => _PixPageState();
}

class _PixPageState extends State<PixPage> {
  bool _showConfirmationBalloon = false;
  List<Map<String, dynamic>> _appointments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagar com PIX'),
      ),
      body: Container(
        color: Colors.grey[100], // Fundo cinza claro
        padding: const EdgeInsets.all(16.0),
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'Pedido: ${widget.orderNumber}',
                        style: const TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),
                      QrImageView(
                        data: widget.pixCode,
                        version: QrVersions.auto,
                        size: 200.0,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: SelectableText(
                                widget.pixCode,
                                style: const TextStyle(fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.copy),
                              onPressed: () {
                                Clipboard.setData(ClipboardData(text: widget.pixCode));
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Chave PIX copiada!')),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _generateReceiptAndSchedule();
                  },
                  child: const Text('Pagar'),
                ),
              ],
            ),
            if (_showConfirmationBalloon)
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showConfirmationBalloon = false;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyAppointmentsPage(appointments: _appointments),
                    ),
                  );
                },
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(16.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: const Text(
                      'Pagamento realizado com sucesso!',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _generateReceiptAndSchedule() {
    final DateTime now = DateTime.now();
    final DateTime appointmentDate = now.add(const Duration(days: 1));
    final double paymentAmount = 100.00; // Valor do pagamento (ajuste conforme necessário)

    setState(() {
      _appointments.add({
        'date': appointmentDate,
        'orderNumber': widget.orderNumber,
        'amount': paymentAmount,
      });
      _showConfirmationBalloon = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Pagamento realizado com sucesso! Comprovante gerado.')),
    );
  }
}