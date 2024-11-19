import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'pagamento_page.dart'; // Importar a nova página de pagamento

class AgendamentodataPage extends StatefulWidget {
  const AgendamentodataPage({super.key});

  @override
  _AgendamentodataPageState createState() => _AgendamentodataPageState();
}

class _AgendamentodataPageState extends State<AgendamentodataPage> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  TimeOfDay? _selectedTime;

  void _confirmarAgendamento() {
    if (_selectedDay == null || _selectedTime == null) {
      // Exibir alerta se a data ou a hora não estiverem selecionadas
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Seleção Incompleta'),
            content: const Text('Por favor, selecione uma data e um horário para continuar.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      // Navegar para a página de pagamento
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const PagamentoPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(child: Text('Escolher Data e Hora')),
      ),
      body: Container(
        color: Colors.grey[100], // Cor de fundo cinza claro
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TableCalendar(
              firstDay: DateTime(2024, 1, 1),
              lastDay: DateTime(2024, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarStyle: CalendarStyle(
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                defaultDecoration: BoxDecoration(
                  color: Colors.white, // Fundo branco para os dias
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                weekendDecoration: BoxDecoration(
                  color: Colors.white, // Fundo branco para os fins de semana
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
            ),
            if (_selectedDay != null) ...[
              const SizedBox(height: 16),
              const Text(
                'Data selecionada:',
                style: TextStyle(fontSize: 18),
              ),
              Text('${_selectedDay!.toLocal()}'.split(' ')[0]),
            ],
            const SizedBox(height: 16),
            const Text(
              'Horários Disponíveis:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () async {
                TimeOfDay? selectedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (selectedTime != null) {
                  setState(() {
                    _selectedTime = selectedTime;
                  });
                }
              },
              child: const Text('Escolher Hora'),
            ),
            if (_selectedTime != null) ...[
              const SizedBox(height: 16),
              Text('Horário selecionado: ${_selectedTime!.format(context)}'),
            ],
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: _confirmarAgendamento,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Cor do botão
                  minimumSize: const Size(200, 50), // Aumentando o tamanho do botão
                  shadowColor: Colors.black26, // Cor da sombra
                  elevation: 10, // Elevação da sombra
                ),
                child: const Text(
                  'Confirmar',
                  style: TextStyle(color: Colors.white, fontSize: 20), // Cor e tamanho do texto do botão
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}