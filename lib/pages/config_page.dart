import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
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
                    color: Cores.corTitulo,
                    shadows: Cores.sombraTitulo,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              //A aparencia da pag
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

              //aqui o contato
              _Secao(
                titulo: t('config.contatoTitulo'),
                child: Column(
                  children: [
                    _Linha(
                      Icons.place,
                      t('config.endereco'),
                      link: t('config.enderecoLink'),
                    ),
                    _Linha(Icons.schedule, t('config.horario')),
                    _Linha(
                      Icons.camera_alt,
                      t('config.instagram'),
                      link: t('config.instagramLink'),
                    ),
                    _Linha(
                      Icons.phone,
                      t('config.whatsapp'),
                      link: t('config.whatsappLink'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 28),

              //  Sobre  ou Créditos
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

// titulo com a caixa roxa
class _Secao extends StatelessWidget {
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
              color: Cores.corTitulo,
              shadows: Cores.sombraTitulo,
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

// linha com icone + texto que e usada no contato
// se tiver link ela fica clicavel
class _Linha extends StatelessWidget {
  final IconData icone;
  final String texto;
  final String? link;
  const _Linha(this.icone, this.texto, {this.link});

  // abre o link no navegador ou no app
  Future<void> _abrir(BuildContext context) async {
    final aberto = await launchUrl(
      Uri.parse(link!),
      mode: LaunchMode.externalApplication,
    );
    // se nao abrir mostra o aviso la embaixo
    if (!aberto && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(t('config.erroLink'))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final clicavel = link != null;

    return InkWell(
      onTap: clicavel ? () => _abrir(context) : null,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(icone, color: Colors.white),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                texto,
                style: clicavel
                    ? _branco.copyWith(decoration: TextDecoration.underline)
                    : _branco,
              ),
            ),
            if (clicavel)
              const Icon(Icons.open_in_new, color: Colors.white, size: 18),
          ],
        ),
      ),
    );
  }
}