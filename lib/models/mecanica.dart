class Mecanica {
  final String texto;
  final String imagem;

  const Mecanica({required this.texto, required this.imagem});

  // cria a Mecanica a partir de um pedaço do json
  factory Mecanica.fromJson(Map<String, dynamic> json) {
    return Mecanica(
      texto: json['texto'] as String,
      imagem: json['imagem'] as String,
    );
  }
}