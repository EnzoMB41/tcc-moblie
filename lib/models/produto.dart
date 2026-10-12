class Produto {
  final String nome;
  final String ingredientes;
  final double preco;
  final String imagem;

  const Produto({
    required this.nome,
    required this.ingredientes,
    required this.preco,
    required this.imagem,
  });

  // aq cria um Produto a partir de um pedaço do JSON
  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      nome: json['nome'] as String,
      ingredientes: json['ingredientes'] as String,
      preco: (json['preco'] as num).toDouble(),
      imagem: json['imagem'] as String,
    );
  }

  // transforma 8.0 em "R$: 8,00"
  String get precoFormatado =>
      'R\$: ${preco.toStringAsFixed(2).replaceAll('.', ',')}';
}