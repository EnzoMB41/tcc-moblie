import 'package:flutter/material.dart';
import '../conteudo.dart';
import '../cores.dart';
import '../models/personagem.dart';
import '../widgets/carrossel.dart';
import '../widgets/pagina_base.dart';

class PersonagensPage extends StatelessWidget {
  const PersonagensPage({super.key});

  @override
  Widget build(BuildContext context) {
    final personagens =
        Conteudo.lista('personagens.lista').map(Personagem.fromJson).toList();

    return PaginaBase(
      rotaVoltar: '/jogo',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            child: Column(
              children: [
                FittedBox(
                  child: Text(
                    t('personagens.titulo'),
                    style: const TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      color: Cores.corTitulo,
                      shadows: Cores.sombraTitulo,
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Icon(Icons.diamond_outlined, size: 16),
                    Expanded(
                      child: Divider(color: Colors.black, thickness: 3),
                    ),
                    Icon(Icons.diamond_outlined, size: 16),
                  ],
                ),
                const SizedBox(height: 4),
                _CaixaRoxa(texto: t('personagens.introducao')),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Expanded(
            child: Carrossel(
              paginas: [
                for (final personagem in personagens)
                  CardCarrossel(
                    imagem: personagem.imagem,
                    titulo: personagem.nome,
                    descricao: personagem.descricao,
                    alturaMaximaImagem: 190,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CaixaRoxa extends StatelessWidget {
  final String texto;

  const _CaixaRoxa({required this.texto});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Cores.roxo,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Cores.roxoBorda, width: 3),
      ),
      child: Text(
        texto,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          height: 1.25,
        ),
      ),
    );
  }
}