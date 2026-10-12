import 'package:flutter/material.dart';
import '../conteudo.dart';
import '../cores.dart';
import '../widgets/pagina_base.dart';
import '../widgets/trailer_player.dart';

class JogoPage extends StatelessWidget {
  const JogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginaBase(
      // aqui faz a pagina inteira rolar
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  t('jogo.titulo'),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Cores.roxoMedio,
                    shadows: [Shadow(color: Colors.cyan, offset: Offset(2, 2))],
                  ),
                ),
              ),

              // linha decorativa
              const Row(
                children: [
                  Icon(Icons.diamond_outlined, size: 22),
                  Expanded(child: Divider(color: Colors.black, thickness: 4)),
                  Icon(Icons.diamond_outlined, size: 22),
                ],
              ),
              const SizedBox(height: 16),

              _Titulo(t('jogo.sobreTitulo')),
              _CaixaRoxa(texto: t('jogo.sobreTexto')),
              const SizedBox(height: 32),

              _Titulo(t('jogo.trailerTitulo')),
              const TrailerPlayer(),
              const SizedBox(height: 32),

              // botao "Personagens"
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/personagens'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Cores.roxo,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: const BorderSide(color: Cores.roxoBorda, width: 4),
                  ),
                ),
                child: Text(
                  t('jogo.botaoPersonagens'),
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              _Titulo(t('jogo.beneficiosTitulo')),
              _CaixaRoxa(texto: t('jogo.beneficiosTexto')),
              const SizedBox(height: 40),

              // o botao "Jogue agora"
              ElevatedButton(
                onPressed: () {}, // depois a gente define o que ele abre
                style: ElevatedButton.styleFrom(
                  backgroundColor: Cores.roxo,
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                    side: const BorderSide(color: Cores.roxoBorda, width: 4),
                  ),
                ),
                child: Text(
                  t('jogo.botaoJogar'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

// titulo roxo de cada seçao tipo "Sobre o jogo", "Trailer" 
class _Titulo extends StatelessWidget {
  final String texto;
  const _Titulo(this.texto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        texto,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
          color: Cores.roxoMedio,
        ),
      ),
    );
  }
}

// caixa roxa com o texto branco
class _CaixaRoxa extends StatelessWidget {
  final String texto;
  const _CaixaRoxa({required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Cores.roxo,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Cores.roxoBorda, width: 4),
      ),
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}