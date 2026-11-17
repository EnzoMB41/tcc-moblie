import 'package:flutter/material.dart';
import '../conteudo.dart';
import '../cores.dart';
import '../models/produto.dart';
import '../widgets/pagina_base.dart';
import '../widgets/linha_decorativa.dart';

class CardapioPage extends StatelessWidget {
  const CardapioPage({super.key});

  @override
  Widget build(BuildContext context) {
    // transforma a lista do JSON em uma lista de produto
    final produtos =
        Conteudo.lista('cardapio.produtos').map(Produto.fromJson).toList();

    return PaginaBase(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
        child: Column(
          children: [
            Text(
              t('cardapio.titulo'),
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: Cores.corTitulo,
                shadows: Cores.sombraTitulo,
              ),
            ),


             const LinhaDecorativa(), // aqui puxa a linha decorativa
            const SizedBox(height: 12),
            

            // Caixa grande e a lista rola dentro dela
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Cores.roxo,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Cores.roxoBorda, width: 4),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: produtos.length,
                  itemBuilder: (context, i) => CardProduto(produto: produtos[i]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// ter que substituir o card, pios oq possibilitar mudar e outro wigets
class CardProduto extends StatelessWidget {
  final Produto produto;

  const CardProduto({super.key, required this.produto});

  // abre a imagem grande numa janelinha
  void _ampliar(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.all(20),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Cores.roxo,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Cores.roxoBorda, width: 4),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    // deixa espaco pro botao de fechar
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      produto.nome,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Flexible(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset(
                        produto.imagem,
                        width: double.infinity,
                        fit: BoxFit.contain,
                        // se a imagem nao existir mostra um icone no lugar
                        errorBuilder: (context, erro, stack) => Container(
                          height: 200,
                          color: Cores.roxoMedio,
                          child: const Center(
                            child: Icon(
                              Icons.local_cafe,
                              size: 80,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // botao de fechar
            IconButton(
              icon: const Icon(Icons.close, color: Colors.white, size: 28),
              onPressed: () => Navigator.pop(dialogContext),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Cores.roxoMedio,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          // foto com borda ae tem que toque pra ampliar
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => _ampliar(context),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(9),
                      child: Image.asset(
                        produto.imagem,
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        // se a imagem ainda nao existir vai mostra um ícone no lugar
                        errorBuilder: (context, erro, stack) => Container(
                          width: 80,
                          height: 80,
                          color: Cores.roxo,
                          child: const Icon(
                            Icons.local_cafe,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  // lupinha no canto pra mostra que da pra ampliar
                  Positioned(
                    right: 4,
                    bottom: 4,
                    child: Container(
                      padding: const EdgeInsets.all(2),
                      decoration: const BoxDecoration(
                        color: Colors.black54,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.zoom_in,
                        size: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),

          // nome e ingredientes
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  produto.nome,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  produto.ingredientes,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),

          // o preço do produto
          Text(
            produto.precoFormatado,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}