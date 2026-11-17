import 'package:flutter/material.dart';
import '../conteudo.dart';
import '../cores.dart';
import '../widgets/pagina_base.dart';
import '../widgets/linha_decorativa.dart';

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

            // titulo principal da pagina
            Text(
              t('inicio.titulo'),
              style: const TextStyle(
                fontSize: 56,
                fontWeight: FontWeight.w900,
                color: Cores.corTitulo,
                shadows: Cores.sombraTitulo,
              ),
            ),

            // linha decorativa em baixo do titulo
             const LinhaDecorativa(),
             
            const SizedBox(height: 12),

            Text(
              t('inicio.subtitulo'),
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w900,
                color: Cores.corTitulo,
                shadows: Cores.sombraTitulo,
              ),
            ),
            const SizedBox(height: 12),

            // a caixa roxa com o texto
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