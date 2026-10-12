import 'package:flutter/material.dart';
import '../conteudo.dart';
import '../cores.dart';
import '../widgets/pagina_base.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginaBase(
      mostrarVoltar: false,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                t('inicio.bemvindo'),
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 4),

            //o titulo principal
            Text(
              t('inicio.titulo'),
              style: const TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w900,
                color: Cores.roxoMedio,
                shadows: [Shadow(color: Colors.cyan, offset: Offset(2, 2))],
              ),
            ),

            // a linha decorativa
            const Row(
              children: [
                Icon(Icons.diamond_outlined, size: 22),
                Expanded(child: Divider(color: Colors.black, thickness: 4)),
                Icon(Icons.diamond_outlined, size: 22),
              ],
            ),
            const SizedBox(height: 12),

            Text(
              t('inicio.subtitulo'),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Cores.roxoMedio,
              ),
            ),
            const SizedBox(height: 12),

            //aq e a caixa roxa com o texto
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Cores.roxo,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.black, width: 4),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    t('inicio.texto'),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}