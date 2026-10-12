import 'package:flutter/material.dart';
import '../cores.dart';

class PaginaBase extends StatelessWidget {
  final Widget child;
  final bool mostrarVoltar;
  final String rotaVoltar; // pra onde a seta de voltar leva

  const PaginaBase({
    super.key,
    required this.child,
    this.mostrarVoltar = true,
    this.rotaVoltar = '/',
  });

  // Vai para uma rota a não ser que a gente já esteja nela ne k
  void _ir(BuildContext context, String rota) {
    if (ModalRoute.of(context)?.settings.name == rota) return;
    Navigator.pushReplacementNamed(context, rota);
  }

  @override
  Widget build(BuildContext context) {
    final escuro = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Cores.roxo,
        toolbarHeight: 70,
        automaticallyImplyLeading: false,
        leadingWidth: 70,
        leading: GestureDetector(
          onTap: () => _ir(context, '/'),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        actions: [
          if (mostrarVoltar)
            IconButton(
              icon: const Icon(Icons.reply, size: 34),
              onPressed: () => _ir(context, rotaVoltar),
            ),
          IconButton(
            icon: const Icon(Icons.settings_outlined, size: 34),
            onPressed: () => _ir(context, '/config'),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('assets/images/fundo.png'),
            fit: BoxFit.cover,
            // No tema escuro, joga uma camada preta por cima da imagem
            colorFilter: escuro
                ? const ColorFilter.mode(Color(0xB3000000), BlendMode.srcOver)
                : null,
          ),
        ),
        child: SafeArea(child: child),
      ),
      bottomNavigationBar: Container(
        color: Cores.roxo,
        height: 80,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.restaurant, size: 40),
              onPressed: () => _ir(context, '/cardapio'),
            ),
            GestureDetector(
              onTap: () => _ir(context, '/jogo'),
              child: ClipOval(
                child: Image.asset(
                  'assets/images/personagem.png',
                  width: 56,
                  height: 56,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}