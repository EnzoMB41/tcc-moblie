import 'package:flutter/material.dart';
import '../conteudo.dart';
import '../cores.dart';
import '../models/personagem.dart';
import '../widgets/pagina_base.dart';

class PersonagensPage extends StatelessWidget {
  const PersonagensPage({super.key});

  @override
  Widget build(BuildContext context) {
    // pega a lista do Json e transforma em uma lista de personagem
    final personagens =
        Conteudo.lista('personagens.lista').map(Personagem.fromJson).toList();

    return PaginaBase(
      rotaVoltar: '/jogo', // a seta volta pra tela do jogo
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  t('personagens.titulo'),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Cores.corTitulo,
                    shadows: Cores.sombraTitulo,
                  ),
                ),
              ),

              // linha de decoraçao
              const Row(
                children: [
                  Icon(Icons.diamond_outlined, size: 22),
                  Expanded(child: Divider(color: Colors.black, thickness: 4)),
                  Icon(Icons.diamond_outlined, size: 22),
                ],
              ),
              const SizedBox(height: 16),

              _CaixaRoxa(texto: t('personagens.introducao')),
              const SizedBox(height: 32),

              // repete o bloco (nome, imagem, texto) para cada personagem
              for (final p in personagens) _BlocoPersonagem(personagem: p),
            ],
          ),
        ),
      ),
    );
  }
}

// o nome + imagem + texto de um personagem
class _BlocoPersonagem extends StatelessWidget {
  final Personagem personagem;
  const _BlocoPersonagem({required this.personagem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Titulo(personagem.nome),
        Container(
          width: 240,
          height: 240,
          decoration: BoxDecoration(
            border: Border.all(color: Cores.roxoBorda, width: 4),
            borderRadius: BorderRadius.circular(30),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(26),
            child: Image.asset(
              personagem.imagem,
              fit: BoxFit.cover,
              // Se a imagem ainda não existir, mostra um ícone no lugar
              errorBuilder: (context, erro, stack) => Container(
                color: Cores.roxoMedio,
                child: const Icon(Icons.person, size: 90, color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _CaixaRoxa(texto: personagem.descricao),
        const SizedBox(height: 32),
      ],
    );
  }
}

// titulo (nome do personagem)
class _Titulo extends StatelessWidget {
  final String texto;
  const _Titulo(this.texto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w900,
          color: Cores.corTitulo,
          shadows: Cores.sombraTitulo,
        ),
      ),
    );
  }
}

//a caixa com texto branco
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