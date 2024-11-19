import 'package:flutter/material.dart';
import 'pix_page.dart';
import 'cartao_credito_page.dart';
import 'cartao_debito_page.dart';

class PagamentoPage extends StatelessWidget {
  const PagamentoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Valor do atendimento do médico escolhido
    final double valorAtendimento = 200.00; // Substitua pelo valor real

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagamento'),
      ),
      body: Container(
        color: Colors.grey[100], // Cor de fundo cinza claro
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            margin: const EdgeInsets.only(top: 0.0), // Subir mais o quadrado na tela
            decoration: BoxDecoration(
              color: Colors.white, // Cor da caixa branca
              borderRadius: BorderRadius.circular(9.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Center(
                  child: Text(
                    'Formas de Pagamento',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.qr_code, size: 30, shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.grey,
                      offset: Offset(2.0, 2.0),
                    ),
                  ]), // Aumentar os ícones
                  title: const Text(
                    'Pix',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black, // Deixar os nomes em preto
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.grey,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PixPage()),
                    );
                  },
                ),
                const Divider(thickness: 1, indent: 16, endIndent: 16),
                ListTile(
                  leading: const Icon(Icons.credit_card, size: 30, shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.grey,
                      offset: Offset(2.0, 2.0),
                    ),
                  ]), // Aumentar os ícones
                  title: const Text(
                    'Cartão de Crédito',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black, // Deixar os nomes em preto
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.grey,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartaoCreditoPage()),
                    );
                  },
                ),
                const Divider(thickness: 1, indent: 16, endIndent: 16),
                ListTile(
                  leading: const Icon(Icons.credit_card, size: 30, shadows: [
                    Shadow(
                      blurRadius: 5.0,
                      color: Colors.grey,
                      offset: Offset(2.0, 2.0),
                    ),
                  ]), // Aumentar os ícones
                  title: const Text(
                    'Cartão de Débito',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black, // Deixar os nomes em preto
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.grey,
                          offset: Offset(2.0, 2.0),
                        ),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartaoDebitoPage()),
                    );
                  },
                ),
                const Divider(thickness: 1, indent: 16, endIndent: 16),
                const SizedBox(height: 16),
                const Center(
                  child: Text(
                    'Resumo de Pagamento',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Valor Total:',
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      'R\$ $valorAtendimento',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}