import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Import necessário para fechar o aplicativo
import 'profile_detail_page.dart';
import 'my_appointments_page.dart';
import 'my_purchases_page.dart';
import 'favorites_page.dart';
import 'home_screen.dart'; // Certifique-se de importar a tela Home

class ProfilePage extends StatelessWidget {
  final List<Map<String, dynamic>> appointments = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100], // Cor de fundo cinza claro
        child: ListView.separated(
          separatorBuilder: (context, index) => Divider(
            color: Colors.grey, // Cor da linha divisória
            thickness: 1,
            indent: 10,
            endIndent: 10,
          ),
          itemCount: 5,
          itemBuilder: (context, index) {
            return _buildListTile(context, index);
          },
        ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, int index) {
    final List<Map<String, dynamic>> items = [
      {'icon': Icons.person, 'text': 'Perfil', 'page': ProfileDetailPage()},
      {'icon': Icons.calendar_today, 'text': 'Meus Agendamentos', 'page': MyAppointmentsPage(appointments: appointments)},
      {'icon': Icons.shopping_cart, 'text': 'Minhas Compras', 'page': MyPurchasesPage()},
      {'icon': Icons.star, 'text': 'Favoritos', 'page': FavoritesPage()},
      {'icon': Icons.exit_to_app, 'text': 'Sair', 'page': null},
    ];

    return ListTile(
      leading: Icon(items[index]['icon'], size: 40, shadows: [
        Shadow(
          blurRadius: 5.0,
          color: Colors.grey,
          offset: Offset(2.0, 2.0),
        ),
      ]),
      title: Text(items[index]['text'], style: TextStyle(fontSize: 20, shadows: [
        Shadow(
          blurRadius: 5.0,
          color: Colors.grey,
          offset: Offset(2.0, 2.0),
        ),
      ])),
      onTap: () {
        if (items[index]['page'] != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => items[index]['page']),
          );
        } else {
          _showExitDialog(context);
        }
      },
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Deseja realmente sair?'),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.close, color: Colors.red),
                onPressed: () {
                  Navigator.of(context).pop(); // Fecha o diálogo
                },
              ),
              IconButton(
                icon: const Icon(Icons.check, color: Colors.green),
                onPressed: () {
                  Navigator.of(context).pop(); // Fecha o diálogo
                  _exitApp();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _exitApp() {
    // Fecha o aplicativo
    SystemNavigator.pop();
  }
}