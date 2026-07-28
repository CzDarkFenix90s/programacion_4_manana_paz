// lib/screens/pantalla_pacientes_mp_paz.dart
import 'package:flutter/material.dart';
import '../models/paciente_ssh_mp_paz.dart';
import '../widgets/fila_paciente_mp_paz.dart';
import '../widgets/tarjeta_paciente_grid_mp_paz.dart';

class PantallaPacientes extends StatefulWidget {
  const PantallaPacientes({super.key});
  @override
  State<PantallaPacientes> createState() => _PantallaPacientesState();
}

class _PantallaPacientesState extends State<PantallaPacientes> {
  final _pacientes = [
    PacienteSSH(id:'1', nombre:'Paciente Juan',  plan:'Dieta Proteica',   capacidad:22,   nutriologo:'Pedro Gómez',   modelo:'Dieta Keto', clima:true,  favorito:true),
    PacienteSSH(id:'2', nombre:'Paciente María',   plan:'Dieta Keto',   capacidad:22,   nutriologo:'Sofía López', modelo:'Plan Vegano',    clima:true),
    PacienteSSH(id:'3', nombre:'Paciente Carlos',  plan:'Plan Vegano',   capacidad:2222, nutriologo:'Dr. Paz',   modelo:'Dieta Keto', clima:false),
    PacienteSSH(id:'4', nombre:'Paciente Ana',  plan:'Dieta Detox', capacidad:22,   nutriologo:'Dr. Paz',  modelo:'Bajo en Carbohidratos', clima:false),
  ];

  bool _modoGrid = false;   // false = lista, true = cuadrícula

  void _toggleFavorito(int i) =>
      setState(() => _pacientes[i].favorito = !_pacientes[i].favorito);

  void _eliminar(int i) => setState(() => _pacientes.removeAt(i));

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Pacientes (${_pacientes.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
        actions: [
          // Toggle lista / cuadrícula
          IconButton(
            icon:    Icon(_modoGrid ? Icons.list : Icons.grid_view),
            onPressed: () => setState(() => _modoGrid = !_modoGrid),
            tooltip: _modoGrid ? 'Vista lista' : 'Vista cuadrícula',
          ),
        ],
      ),
      body: _modoGrid
          ? GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:   2,
                childAspectRatio: 1.1,
                crossAxisSpacing: 8,
                mainAxisSpacing:  8,
              ),
              itemCount:   _pacientes.length,
              itemBuilder: (ctx, i) => TarjetaPacienteGrid(
                bus:   _pacientes[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            )
          : ListView.separated(
              itemCount:        _pacientes.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) => FilaPaciente(
                bus:   _pacientes[i],
                onFavorito: () => _toggleFavorito(i),
                onEliminar: () => _eliminar(i),
              ),
            ),
    );
  }
}