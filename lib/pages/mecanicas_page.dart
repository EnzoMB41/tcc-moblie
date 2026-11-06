import 'package:flutter/material.dart';
import '../conteudo.dart';
import '../cores.dart';
import '../models/mecanica.dart';
import '../widgets/pagina_base.dart';

class MecanicasPage extends StatelessWidget {
  const MecanicasPage({super.key});

  @override
  Widget build(BuildContext context) {
    // pega a lista do json e faz lista da Mecanica
    final mecanicas =
        Conteudo.lista('mecanicas.lista').map(Mecanica.fromJson).toList();

    return PaginaBase(
      rotaVoltar: '/jogo', // a seta volta pra tela do jogo
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  t('mecanicas.titulo'),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Cores.corTitulo,
                    shadows: Cores.sombraTitulo,
                  ),
                ),
              ),

              // a linha preta
              const Row(
                children: [
                  Icon(Icons.diamond_outlined, size: 22),
                  Expanded(child: Divider(color: Colors.black, thickness: 4)),
                  Icon(Icons.diamond_outlined, size: 22),
                ],
              ),
              const SizedBox(height: 24),

              // Repete o bloco com textos e etc para cada mecânica
              for (final m in mecanicas) _BlocoMecanica(mecanica: m),
            ],
          ),
        ),
      ),
    );
  }
}

// texto em cima e imagem embaixo
class _BlocoMecanica extends StatelessWidget {
  final Mecanica mecanica;
  const _BlocoMecanica({required this.mecanica});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CaixaRoxa(texto: mecanica.texto),
        const SizedBox(height: 16),

        //deixa imagem com a largura toda e proporção 16:10
        //para ficar mais visualmente bonito
        AspectRatio(
          aspectRatio: 16 / 10,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Cores.roxoBorda, width: 4),
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(26),
              child: Image.asset(
                mecanica.imagem,
                fit: BoxFit.cover,
                // mostra o icone no lugar se a imagem ainda nao existi
                errorBuilder: (context, erro, stack) => Container(
                  color: Cores.roxoMedio,
                  child: const Icon(Icons.image, size: 80, color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}

// caixa e texto
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