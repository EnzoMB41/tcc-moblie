import 'package:flutter/material.dart';
// fiz essa aba para nao ficar colocando o mesmo codigo varias vezes... e so puxar                  
// aqui eu fiz a linha decorativa com a imagem lineborder.png
class LinhaDecorativa extends StatelessWidget {
  final double altura;

  const LinhaDecorativa({super.key, this.altura = 28});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: altura,
      child: Image.asset(
        'assets/images/lineborder.png',
        fit: BoxFit.contain,
        //e se a imagem nao existir mostra uma linha simples no lugar
        errorBuilder: (context, erro, stack) => const Center(
          child: Divider(color: Colors.black, thickness: 3),
        ),
      ),
    );
  }
}