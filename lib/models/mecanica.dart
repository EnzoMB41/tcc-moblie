class Mecanica {
  final String? titulo;
  final String texto;
  final String imagem;

  const Mecanica({this.titulo, required this.texto, required this.imagem});

  // cria uma mecanica a partir de um pedaço do JSON
  factory Mecanica.fromJson(Map<String, dynamic> json) {
    return Mecanica(
      titulo: json['titulo'] as String?,
      texto: json['texto'] as String,
      imagem: json['imagem'] as String,
    );
  }
}