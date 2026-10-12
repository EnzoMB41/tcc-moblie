import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class Conteudo {
  static Map<String, dynamic> _dados = {};

  // le o arquivo JSON e roda uma vez antes do app abrir.
  // (Quando tiver API, é só esta função que muda.)
  static Future<void> carregar() async {
    final texto = await rootBundle.loadString('assets/data/conteudo.json');
    _dados = jsonDecode(texto) as Map<String, dynamic>;
  }

  // procura um valor pelo caminho tipo : 'inicio.titulo'
  static dynamic _buscar(String caminho) {
    dynamic atual = _dados;
    for (final parte in caminho.split('.')) {
      if (atual is Map && atual.containsKey(parte)) {
        atual = atual[parte];
      } else {
        return null;
      }
    }
    return atual;
  }

  // devolve um texto, se o caminho não existir ele mostra :  [caminho] na tela
  static String texto(String caminho) =>
      _buscar(caminho)?.toString() ?? '[$caminho]';

  // devolve uma lista tipo produtos, personagens etc
  static List<Map<String, dynamic>> lista(String caminho) {
    final valor = _buscar(caminho);
    if (valor is List) return valor.cast<Map<String, dynamic>>();
    return [];
  }
}

// Atalho: t('inicio.titulo') em vez de Conteudo.texto('inicio.titulo')
String t(String caminho) => Conteudo.texto(caminho);