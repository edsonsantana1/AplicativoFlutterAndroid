import 'package:flutter/material.dart';
import 'fono_detail_page.dart';
import 'agendamentodata_page.dart'; // Certifique-se de criar e importar a tela agendamentodata_page

class AgendarPage extends StatefulWidget {
  final doctor;

  const AgendarPage({super.key, required this.doctor});

  @override
  _AgendarPageState createState() => _AgendarPageState();
}

class _AgendarPageState extends State<AgendarPage> {
  String? _tipoConsulta;

  void _confirmarAgendamento() {
    if (_tipoConsulta == null) {
      // Exibir alerta se nenhum tipo de consulta for selecionado
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Tipo de Consulta'),
            content: const Text('Por favor, selecione um tipo de consulta para continuar.'),
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
      // Navegar para a página de agendamento de data
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const AgendamentodataPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar com ${widget.doctor.name}'),
      ),
      body: Container(
        color: Colors.grey[100], // Cor de fundo cinza claro
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 240, // Aumentando a largura da caixa para a foto
                height: 240, // Aumentando a altura da caixa para a foto
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                  image: DecorationImage(
                    image: AssetImage(widget.doctor.imagePath), // Substitua pelo caminho correto da imagem
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  Text('${widget.doctor.name}', style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  const Text('Especialidade: Fonoaudiólogo', style: TextStyle(fontSize: 18)),
                  Text('Anos de experiência: ${widget.doctor.experience}', style: const TextStyle(fontSize: 18)),
                  const Text('Endereço: Rua Exemplo, 123, Cidade', style: TextStyle(fontSize: 18)),
                  const Text('Valor do Atendimento: R\$ 200,00', style: TextStyle(fontSize: 18)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(5, (index) => const Icon(Icons.star, color: Colors.yellow, size: 30)),
                  ),
                  const SizedBox(height: 16),
                  const Text('Tipo de Consulta:', style: TextStyle(fontSize: 18)),
                  Row(
                    children: [
                      Expanded(
                        child: RadioListTile(
                          title: const Text('Consultório'),
                          value: 'consultorio',
                          groupValue: _tipoConsulta,
                          onChanged: (value) {
                            setState(() {
                              _tipoConsulta = value.toString();
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: RadioListTile(
                          title: const Text('Casa do Paciente'),
                          value: 'casa_paciente',
                          groupValue: _tipoConsulta,
                          onChanged: (value) {
                            setState(() {
                              _tipoConsulta = value.toString();
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const TextField(
                    decoration: InputDecoration(
                      labelText: 'Sugerir Valor',
                      border: OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.white, // Campo em branco
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _confirmarAgendamento,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // Cor do botão
                      minimumSize: const Size(200, 50), // Aumentando o tamanho do botão
                      shadowColor: Colors.black26, // Cor da sombra
                      elevation: 10, // Elevação da sombra
                    ),
                    child: const Text(
                      'Confirmar',
                      style: TextStyle(color: Colors.white, fontSize: 25), // Cor e tamanho do texto do botão
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}