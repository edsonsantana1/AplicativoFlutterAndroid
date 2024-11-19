import 'package:flutter/material.dart';
import 'profile_screen.dart';
import 'bottom_navigation_bar.dart';
import 'destaque_detail_page.dart' as destaque;
import 'fono_detail_page.dart';
import 'fisioterapeuta_detail_page.dart';
import 'psicologo_detail_page.dart';
import 'pediatra_detail_page.dart';
import 'psiquiatra_detail_page.dart';
import 'recomendado_detail_page.dart' as recomendado;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  List<Widget> _pages = [];

  @override
  void initState() {
    super.initState();
    _pages = [
      _homePage(), // Página Home personalizada
      Center(child: Text('Notificações')), // Notificações temporária
      ProfilePage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _homePage() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search, color: Colors.blue), // Azul Royal
                    hintText: 'Buscar',
                    hintStyle: TextStyle(color: Colors.black), // Texto preto
                    border: InputBorder.none,
                  ),
                  textAlign: TextAlign.right, // Alinha o texto à direita
                  style: TextStyle(color: Colors.black), // Texto preto
                ),
              ),
            ),
            const Text('Destaque', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)), // Texto preto
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildBox(context, 'assets/images/img1.png', 'Detalhe 1', destaque.DetailPage('Destaque')),
                  _buildBox(context, 'assets/images/img2.png', 'Detalhe 2', destaque.DetailPage('Destaque')),
                  _buildBox(context, 'assets/images/img3.png', 'Detalhe 3', destaque.DetailPage('Destaque')),
                  _buildBox(context, 'assets/images/img4.png', 'Detalhe 4', destaque.DetailPage('Destaque')),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Especialidades', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)), // Texto preto
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildSpecialtyIcon(context, 'assets/images/fono.png', 'Fonoaudiólogo', FonoDetailPage()),
                  _buildSpecialtyIcon(context, 'assets/images/fisiote.png', 'Fisioterapeuta', FisioterapeutaDetailPage()),
                  _buildSpecialtyIcon(context, 'assets/images/psicol.png', 'Psicólogo', PsicologoDetailPage()),
                  _buildSpecialtyIcon(context, 'assets/images/pediat.png', 'Pediatra', PediatraDetailPage()),
                  _buildSpecialtyIcon(context, 'assets/images/psiquiatra.png', 'Psiquiatra', PsiquiatraDetailPage()),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Recomendados', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black)), // Texto preto
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildBox(context, 'assets/images/img5.png', 'Detalhe 5', recomendado.DetailPage('Recomendados')),
                  _buildBox(context, 'assets/images/img6.png', 'Detalhe 6', recomendado.DetailPage('Recomendados')),
                  _buildBox(context, 'assets/images/img7.png', 'Detalhe 7', recomendado.DetailPage('Recomendados')),
                  _buildBox(context, 'assets/images/img8.png', 'Detalhe 8', recomendado.DetailPage('Recomendados')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBox(BuildContext context, String imagePath, String title, Widget detailPage) {
    return GestureDetector(
      onTap: () {
        // Navegar para a página de detalhes
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => detailPage),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          width: 200,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(2, 2),
              ),
            ],
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpecialtyIcon(BuildContext context, String imagePath, String text, Widget detailPage) {
    return GestureDetector(
      onTap: () {
        // Navegar para a página de detalhes
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => detailPage),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0), // Bordas arredondadas
                gradient: LinearGradient(
                  colors: [Colors.blue, Colors.purple], // Gradiente de cores
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(2, 2),
                  ),
                ],
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Text(text, style: TextStyle(color: Colors.black)), // Texto preto
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[100], // Cor de fundo cinza claro
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.grey[100], // Cor de fundo cinza claro
              elevation: 0,
              actions: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/user.jpg'),
                  radius: 30,
                ),
                const SizedBox(width: 10),
              ],
            ),
            Expanded(
              child: _pages[_selectedIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}