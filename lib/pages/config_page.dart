import 'package:flutter/material.dart';
import '../conteudo.dart';
import '../cores.dart';
import '../tema.dart';
import '../widgets/pagina_base.dart';

const _branco = TextStyle(
  color: Colors.white,
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PaginaBase(
      child: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              FittedBox(
                child: Text(
                  t('config.titulo'),
                  style: const TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.w900,
                    color: Cores.roxoMedio,
                    shadows: [Shadow(color: Colors.cyan, offset: Offset(2, 2))],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              //aparencia
              _Secao(
                titulo: t('config.aparenciaTitulo'),
                child: ValueListenableBuilder<ThemeMode>(
                  valueListenable: modoTema,
                  builder: (context, modo, _) {
                    return SwitchListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(t('config.temaEscuro'), style: _branco),
                      secondary:
                          const Icon(Icons.dark_mode, color: Colors.white),
                      activeTrackColor: Cores.rosa,
                      value: modo == ThemeMode.dark,
                      onChanged: (ligado) {
                        modoTema.value =
                            ligado ? ThemeMode.dark : ThemeMode.light;
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 28),

              //contato
              _Secao(
                titulo: t('config.contatoTitulo'),
                child: Column(
                  children: [
                    _Linha(Icons.place, t('config.endereco')),
                    _Linha(Icons.schedule, t('config.horario')),
                    _Linha(Icons.camera_alt, t('config.instagram')),
                    _Linha(Icons.phone, t('config.whatsapp')),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              // creditos aq
              _Secao(
                titulo: t('config.sobreTitulo'),
                child: Column(
                  children: [
                    Text(
                      t('config.nomeApp'),
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(t('config.versao'), style: _branco),
                    const SizedBox(height: 16),
                    Text(t('config.equipeTitulo'), style: _branco),
                    Text(
                      t('config.equipe'),
                      textAlign: TextAlign.center,
                      style: _branco,
                    ),
                    const SizedBox(height: 16),
                    Text(t('config.feitoCom'), style: _branco),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}


class _Secao extends StatelessWidget {//caixa e o texto
  final String titulo;
  final Widget child;
  const _Secao({required this.titulo, required this.child});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Text(
            titulo,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Cores.roxoMedio,
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Cores.roxo,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Cores.roxoBorda, width: 4),
          ),
          child: child,
        ),
      ],
    );
  }
}

// linha com icone + texto (usada no Contato)
class _Linha extends StatelessWidget {
  final IconData icone;
  final String texto;
  const _Linha(this.icone, this.texto);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icone, color: Colors.white),
          const SizedBox(width: 12),
          Expanded(child: Text(texto, style: _branco)),
        ],
      ),
    );
  }
}