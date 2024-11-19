import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart'; // Import necessário para selecionar a imagem
import 'dart:io'; // Import necessário para trabalhar com arquivos

class ProfileDetailPage extends StatefulWidget {
  @override
  _ProfileDetailPageState createState() => _ProfileDetailPageState();
}

class _ProfileDetailPageState extends State<ProfileDetailPage> {
  File? _image; // Variável para armazenar a imagem selecionada

  // Controladores para os campos de texto
  final TextEditingController _nomeController = TextEditingController(text: "José da Silva");
  final TextEditingController _dataNascimentoController = TextEditingController(text: "01/01/1990");
  final TextEditingController _emailController = TextEditingController(text: "jose.silva@example.com");
  final TextEditingController _telefoneController = TextEditingController(text: "(11) 98765-4321");
  final TextEditingController _enderecoController = TextEditingController(text: "Rua Exemplo, 123, São Paulo, SP");

  // Função para selecionar a imagem
  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  // Função para salvar as informações editadas
  void _saveProfile() {
    // Aqui você pode adicionar a lógica para salvar as informações editadas
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Informações salvas com sucesso!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes do Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: _image != null ? FileImage(_image!) : null,
                    child: _image == null
                        ? Icon(Icons.person, size: 50)
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt, color: Colors.blue),
                      onPressed: _pickImage,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            _buildEditableProfileInfo("Nome", _nomeController),
            SizedBox(height: 20),
            _buildEditableProfileInfo("Data de Nascimento", _dataNascimentoController),
            SizedBox(height: 20),
            _buildEditableProfileInfo("E-mail", _emailController),
            SizedBox(height: 20),
            _buildEditableProfileInfo("Telefone", _telefoneController),
            SizedBox(height: 20),
            _buildEditableProfileInfo("Endereço", _enderecoController),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Cor azul
                  minimumSize: Size(double.infinity, 50), // Aumenta o tamanho horizontal
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), // Aumenta o tamanho da fonte e negrito
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5, // Adiciona elevação para sombra
                  shadowColor: Colors.black.withOpacity(0.5), // Cor da sombra
                ),
                child: Text(
                  'Salvar',
                  style: TextStyle(color: Colors.white), // Cor branca
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableProfileInfo(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0), // Bordas arredondadas
            ),
            filled: true,
            fillColor: Colors.grey[200],
          ),
        ),
      ],
    );
  }
}