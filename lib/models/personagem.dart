class Personagem {
  final String nome;
  final String descricao;
  final String imagem;

  const Personagem({
    required this.nome,
    required this.descricao,
    this.imagem = 'assets/images/personagem.png',
  });

  // cria um Personagem a partir de um pedaço do JSON
  factory Personagem.fromJson(Map<String, dynamic> json) {
    return Personagem(
      nome: json['nome'] as String,
      descricao: json['descricao'] as String,
      imagem: (json['imagem'] as String?) ?? 'assets/images/personagem.png',
    );
  }
}