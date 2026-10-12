import 'package:flutter/material.dart';
import 'conteudo.dart';
import 'cores.dart';
import 'tema.dart';
import 'pages/inicio_page.dart';
import 'pages/cardapio_page.dart';
import 'pages/jogo_page.dart';
import 'pages/personagens_page.dart';
import 'pages/config_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Conteudo.carregar(); // le o JSON antes de abrir o app
  runApp(const DiscoffeApp());
}

class DiscoffeApp extends StatelessWidget {
  const DiscoffeApp({super.key});

  @override
  Widget build(BuildContext context) {
    // redesenha o app inteiro quando o tema muda
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: modoTema,
      builder: (context, modo, _) {
        return MaterialApp(
          title: t('app.nome'),
          debugShowCheckedModeBanner: false,
          themeMode: modo,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Cores.roxo),
            scaffoldBackgroundColor: Cores.fundo,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Cores.roxo,
              brightness: Brightness.dark,
            ),
            scaffoldBackgroundColor: const Color(0xFF1A1625),
          ),
          initialRoute: '/',
          routes: {
            '/': (context) => const InicioPage(),
            '/cardapio': (context) => const CardapioPage(),
            '/jogo': (context) => const JogoPage(),
            '/personagens': (context) => const PersonagensPage(),
            '/config': (context) => const ConfigPage(),
          },
        );
      },
    );
  }
}