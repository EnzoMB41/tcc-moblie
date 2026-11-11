import 'dart:ui' show PointerDeviceKind;
import 'package:flutter/material.dart';
import '../cores.dart';

class Carrossel extends StatefulWidget {
  final List<Widget> paginas;

  const Carrossel({super.key, required this.paginas});

  @override
  State<Carrossel> createState() => _CarrosselState();
}

class _CarrosselState extends State<Carrossel> {
  final PageController _controller = PageController();
  int _atual = 0;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _ir(int pagina) {
    _controller.animateToPage(
      pagina,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final total = widget.paginas.length;
    final corSetas = Theme.of(context).brightness == Brightness.dark
        ? Cores.corTitulo
        : Cores.roxoBorda;

    return Column(
      children: [
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse,
              },
            ),
            child: PageView(
              controller: _controller,
              onPageChanged: (pagina) {
                setState(() => _atual = pagina);
              },
              children: [
                for (final pagina in widget.paginas)
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 4, 20, 0),
                    child: pagina,
                  ),
              ],
            ),
          ),
        ),
        if (total > 1)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                tooltip: 'Anterior',
                color: corSetas,
                icon: const Icon(Icons.chevron_left, size: 30),
                onPressed: _atual > 0 ? () => _ir(_atual - 1) : null,
              ),
              IconButton(
                tooltip: 'Próximo',
                color: corSetas,
                icon: const Icon(Icons.chevron_right, size: 30),
                onPressed: _atual < total - 1 ? () => _ir(_atual + 1) : null,
              ),
            ],
          ),
      ],
    );
  }
}

class CardCarrossel extends StatelessWidget {
  final String imagem;
  final String descricao;
  final String? titulo;
  final double alturaMaximaImagem;

  const CardCarrossel({
    super.key,
    required this.imagem,
    required this.descricao,
    this.titulo,
    this.alturaMaximaImagem = 260,
  });

  @override
  Widget build(BuildContext context) {
    final nome = titulo;
    final fundoImagem = Color.lerp(Cores.fundo, Cores.roxo, 0.2)!;

    return LayoutBuilder(
      builder: (context, limites) {
        final alturaImagem = (limites.maxHeight * 0.55)
            .clamp(0.0, alturaMaximaImagem)
            .toDouble();

        return SingleChildScrollView(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Cores.roxoBorda,
              border: Border.all(color: Cores.roxoBorda, width: 2),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: alturaImagem,
                  child: ColoredBox(
                    color: fundoImagem,
                    child: Image.asset(
                      imagem,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(
                        child: Icon(
                          Icons.image_outlined,
                          color: Cores.roxoBorda,
                          size: 40,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (nome != null) ...[
                        Text(
                          nome.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        const SizedBox(height: 4),
                      ],
                      Text(
                        descricao,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}