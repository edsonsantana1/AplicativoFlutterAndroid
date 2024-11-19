import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Para formatar datas e horários

class MyAppointmentsPage extends StatelessWidget {
  final List<Map<String, dynamic>> appointments;

  const MyAppointmentsPage({required this.appointments, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Agendamentos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: appointments.isEmpty
            ? const Center(
          child: Text(
            'Nenhum agendamento encontrado.',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ),
        )
            : ListView.builder(
          itemCount: appointments.length,
          itemBuilder: (context, index) {
            final appointment = appointments[index];
            return _buildAppointmentCard(
              appointment['date'],
              appointment['orderNumber'],
              appointment['amount'],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAppointmentCard(DateTime date, String orderNumber, double amount) {
    final dateFormatter = DateFormat('dd/MM/yyyy');
    final timeFormatter = DateFormat('HH:mm');

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text('Pedido: $orderNumber'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Data: ${dateFormatter.format(date)}'),
            Text('Horário: ${timeFormatter.format(date)}'),
            Text('Valor: R\$${amount.toStringAsFixed(2)}'),
          ],
        ),
        leading: const Icon(Icons.calendar_today, color: Colors.blue),
      ),
    );
  }
}