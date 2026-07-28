// lib/main_mp_paz.dart
import 'package:flutter/material.dart';
import 'package:modulo07_layouts_mp_paz/widgets/avatar_badge_mp_paz.dart';
import 'package:modulo07_layouts_mp_paz/widgets/customized_sized_box_mp_paz.dart';
import 'package:modulo07_layouts_mp_paz/widgets/fila_estado_mp_paz.dart';
import 'package:modulo07_layouts_mp_paz/widgets/tarjeta_observacion_mp_paz.dart';

// ┌──────────────────────────────────────────────────────────────────┐
// │  Cambia este número y guarda (Ctrl+S) para navegar entre pasos. │
// │  1  Paso 1  Container — decoración y espaciado                  │
// │  2  Paso 2  Column — TarjetaObservacion                                 │
// │  3  Paso 3  Row + Expanded + Spacer — FilaEstadoPaciente                │
// │  4  Paso 4  Stack + Positioned — AvatarBadgePaciente                   │
// │  5  Paso 5  SizedBox, Padding, Align, Wrap                      │
// └──────────────────────────────────────────────────────────────────┘
const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: switch (paso) {
    1 => _paso1(),
    2 => Scaffold(
      body: ListView(
        children: [
          TarjetaObservacion(nivel: 'ERROR', componente: 'auth-service',
              mensaje:   'Token expirado — usuario forzado a re-login',
              timestamp: DateTime.now()),
          TarjetaObservacion(nivel: 'WARN',  componente: 'db-pool',
              mensaje:   'Conexiones disponibles: 2 / 10',
              timestamp: DateTime.now().subtract(const Duration(minutes: 2))),
          TarjetaObservacion(nivel: 'INFO',  componente: 'scheduler',
              mensaje:   'Tarea de backup completada',
              timestamp: DateTime.now().subtract(const Duration(minutes: 5))),
          TarjetaObservacion(nivel: 'DEBUG', componente: 'http-client',
              mensaje:   'GET /api/status → 200 OK (38ms)',
              timestamp: DateTime.now().subtract(const Duration(minutes: 8))),
        ],
      ),
    ),
    3 => const Scaffold(
      body: Column(
        children: [
          FilaEstadoPaciente(nombre: 'Dieta Proteica',   detalle: '10.0.0.5 · 45ms',          activo: true),
          Divider(height: 1),
          FilaEstadoPaciente(nombre: 'db-primary',    detalle: '10.0.0.12 · 8ms',           activo: true),
          Divider(height: 1),
          FilaEstadoPaciente(nombre: 'Bus-Respaldo', detalle: '10.0.0.30 · fuera de servicio', activo: false),
          Divider(height: 1),
          FilaEstadoPaciente(nombre: 'Consultorio Central - Dr. Paz',
                     detalle: '10.0.0.8 · 12ms', activo: true),
        ],
      ),
    ),
    4 => const Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarBadgePaciente(nombre: 'Paciente A', observaciones: 2,  activo: true),
            SizedBox(width: 24),
            AvatarBadgePaciente(nombre: 'Dieta Proteica', observaciones: 0,  activo: true),
            SizedBox(width: 24),
            AvatarBadgePaciente(nombre: 'Paciente B', observaciones: 0,  activo: false),
            SizedBox(width: 24),
            AvatarBadgePaciente(nombre: 'Consultorio', observaciones: 11, activo: true),
          ],
        ),
      ),
    ),
    5 => Scaffold(
      body:Center(
        child: CustomizedSizedBoxPaciente(
          mainAxisAlignment: MainAxisAlignment.center,
          height: 0,
          width: 0,
          children: [
            AvatarBadgePaciente(nombre: 'Paciente A', observaciones: 2,  activo: true),
            SizedBox(width: 24),
            AvatarBadgePaciente(nombre: 'Dieta Proteica', observaciones: 0,  activo: true),
            SizedBox(width: 24),
            AvatarBadgePaciente(nombre: 'Paciente B', observaciones: 0,  activo: false),
            SizedBox(width: 24),
            AvatarBadgePaciente(nombre: 'Consultorio', observaciones: 11, activo: true),
          ],
        ),
      ),
    ),
    _ => Scaffold(body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

// ─── Paso 1 — Container (vive aquí en main_mp_paz.dart) ─────────────────────
Widget _paso1() => Scaffold(
  body: Center(
    child: Container(
      width:   double.infinity,
      height:  80,
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color:        Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(0),
        border:       Border(left: BorderSide(color: Colors.indigo, width: 4)),
        boxShadow: [
          BoxShadow(
            color:      Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset:     const Offset(0, 2),
          ),
        ],
      ),
      child: const Text('Bus web-01',
          style: TextStyle(fontWeight: FontWeight.bold)),
    ),
  ),
);