import 'package:flutter/material.dart';

class Cores {
  static const roxo = Color(0xFF9461FB);        // barras e caixas grandes
  static const roxoMedio = Color(0xFF8B3DF0);   // cards do cardápio
  static const roxoBorda = Color(0xFF4A1D9E);   // contorno das caixas
  static const rosa = Color(0xFFF472B6);
  static const fundo = Color(0xFFF1F1F1);

  // Estilo dos títulos
  static const corTitulo = Color.fromARGB(255, 178, 124, 248);
  static const sombraTitulo = [
    Shadow(color: Color.fromARGB(255, 0, 0, 0), offset: Offset(2, 2)),
  ];
}
//aqui vai guarda as cores das paginas em um lugar so bro
//tipo nao preciso ficar procurando elas pelo codigo e so mudar aqui
//facilita muito