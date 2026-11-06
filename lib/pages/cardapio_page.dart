import 'package:flutter/material.dart';
import '../conteudo.dart';
import '../cores.dart';
import '../models/produto.dart';
import '../widgets/pagina_base.dart';

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
            const SizedBox(height: 12),

            // Caixa grande; a lista rola dentro dela
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

class CardProduto extends StatelessWidget {
  final Produto produto;

  const CardProduto({super.key, required this.produto});

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
          // coloca a foto com borda
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
                // se a imagem ainda nao existir mostra um icone no lugar
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
          const SizedBox(width: 12),

          // nome e o ingredientes
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

          //os preços
          Text(
            produto.precoFormatado,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}