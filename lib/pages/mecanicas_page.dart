import 'package:flutter/material.dart';
import '../conteudo.dart';
import '../cores.dart';
import '../models/mecanica.dart';
import '../widgets/carrossel.dart';
import '../widgets/pagina_base.dart';

class MecanicasPage extends StatelessWidget {
  const MecanicasPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mecanicas =
        Conteudo.lista('mecanicas.lista').map(Mecanica.fromJson).toList();

    return PaginaBase(
      rotaVoltar: '/jogo',
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
            child: Column(
              children: [
                FittedBox(
                  child: Text(
                    t('mecanicas.titulo'),
                    style: const TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w900,
                      color: Cores.corTitulo,
                      shadows: Cores.sombraTitulo,
                    ),
                  ),
                ),
                const Row(
                  children: [
                    Icon(Icons.diamond_outlined, size: 20),
                    Expanded(
                      child: Divider(color: Colors.black, thickness: 3),
                    ),
                    Icon(Icons.diamond_outlined, size: 20),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: Carrossel(
              paginas: [
                for (final mecanica in mecanicas)
                  CardCarrossel(
                    imagem: mecanica.imagem,
                    descricao: mecanica.texto,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}