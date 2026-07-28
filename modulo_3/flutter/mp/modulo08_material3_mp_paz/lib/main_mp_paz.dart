// lib/main_mp_paz.dart
import 'package:flutter/material.dart';
import 'package:modulo08_material3_mp_paz/screens/catalogo_botones_mp_paz.dart';
import 'package:modulo08_material3_mp_paz/screens/pantalla_appbar_mp_paz.dart';
import 'package:modulo08_material3_mp_paz/screens/pantalla_dialogs_mp_paz.dart';
import 'package:modulo08_material3_mp_paz/screens/pantalla_navegacion_mp_paz.dart';
import 'package:modulo08_material3_mp_paz/screens/pantalla_tema_mp_paz.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  ThemeData + Scaffold básico                         │
// │  2  Paso 2  Modo oscuro — ThemeMode dinámico                    │
// │  3  Paso 3  AppBar variantes y SliverAppBar                     │
// │  4  Paso 4  Botones Material 3                                  │
// │  5  Paso 5  NavigationBar con 4 pestañas                        │
// │  6  Paso 6  SnackBar y AlertDialog                              │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 5;

void main() => runApp(const AppConsultorio());

class AppConsultorio extends StatefulWidget {
  const AppConsultorio({super.key});
  @override
  State<AppConsultorio> createState() => _AppConsultorioState();
}

class _AppConsultorioState extends State<AppConsultorio> {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  Widget build(BuildContext context) {
    const seedColor = Color(0xFF1565C0);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: _themeMode,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: seedColor, brightness: Brightness.dark),
        useMaterial3: true,
      ),
      home: switch (paso) {
        1 => const _Paso1(),
        2 => PantallaTema(
       themeMode: _themeMode,
       onToggle:  (mode) => setState(() => _themeMode = mode),
     ),
     3 => const PantallaAppBar(),
     4 => const CatalogoBotones(),
     5 => const PantallaNavegacion(),
     6 => const PantallaDialogs(),
        _ => Scaffold(
            body: Center(child: Text('Paso $paso: crea el widget primero'))),
      },
      
    );
    
  }
}

// ─── Paso 1 — vive en main_mp_paz.dart ────────────────────────────────────────
class _Paso1 extends StatelessWidget {
  const _Paso1();

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title:           const Text('Consultorio Dietético'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          IconButton(icon: const Icon(Icons.refresh), onPressed: () {}),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.restaurant, size: 64, color: cs.primary),
            const SizedBox(height: 16),
            Text(
              'Paciente Pedro',
              style: text.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Dieta Proteica · Control Mensual',
              style: text.bodyMedium?.copyWith(color: cs.onSurfaceVariant),
            ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {},
              icon:  const Icon(Icons.contact_phone),
              label: const Text('Contactar nutriologo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}