import 'package:flutter/material.dart';
import 'agendar_page.dart'; // Certifique-se de que este import está correto
import 'doctor.dart'; // Importando a classe Doctor

class DetailPage extends StatefulWidget {
  final String title;

  DetailPage(this.title);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final List<Doctor> _doctors = [
    Doctor(
      imagePath: 'assets/images/doctor1.png',
      name: 'Dr. Paula Freitas',
      experience: 10,
      patients: 78,
    ),
    Doctor(
      imagePath: 'assets/images/doctor2.png',
      name: 'Dr. Roberto Santana',
      experience: 8,
      patients: 65,
    ),
    Doctor(
      imagePath: 'assets/images/doctor3.png',
      name: 'Dr. Joana Silva',
      experience: 12,
      patients: 90,
    ),
    Doctor(
      imagePath: 'assets/images/doctor4.png',
      name: 'Dr. Carla Souza',
      experience: 5,
      patients: 40,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.grey[100], // Cor de fundo cinza claro
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Buscar',
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _doctors.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AgendarPage(doctor: _doctors[index]),
                        ),
                      );
                    },
                    child: _buildDoctorCard(context, _doctors[index]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDoctorCard(BuildContext context, Doctor doctor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(color: Colors.grey),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      image: DecorationImage(
                        image: AssetImage(doctor.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(doctor.name, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                            Row(
                              children: List.generate(5, (index) => const Icon(Icons.star, color: Colors.yellow, size: 20)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text('Anos de experiência: ${doctor.experience}'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Pacientes atendidos: ${doctor.patients}'),
                            IconButton(
                              icon: const Icon(Icons.favorite_border),
                              onPressed: () {
                                // Adicionar aos favoritos
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}