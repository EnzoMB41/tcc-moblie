import 'package:flutter/material.dart';

// Qualquer tela pode mudar isso e o app se redesenha sozinho
final ValueNotifier<ThemeMode> modoTema = ValueNotifier(ThemeMode.light);