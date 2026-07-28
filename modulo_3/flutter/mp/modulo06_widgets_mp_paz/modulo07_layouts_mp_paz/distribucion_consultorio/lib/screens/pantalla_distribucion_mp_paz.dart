import 'package:flutter/material.dart';
import '../models/paciente_mp_paz.dart';
import '../widgets/chip_resumen_mp_paz.dart';
import '../widgets/fila_paciente_mp_paz.dart';

class PantallaDistribucion extends StatelessWidget {
  const PantallaDistribucion({super.key});

  @override
  Widget build(BuildContext context) {
    final pacientes = [
      const InfoPaciente(
        nombre: 'Dr. Paz (Principal)', tipo: 'nutricionista',
        plan: '10.0.0.1', activo: true, observaciones: 2,
        etiquetas: ['BGP', 'OSPF', 'Gateway'],
      ),
      const InfoPaciente(
        nombre: 'Consultorio A', tipo: 'recepcion',
        plan: '10.0.1.1', activo: true, observaciones: 0,
        etiquetas: ['L3', 'VLAN 10', 'VLAN 20'],
      ),
      const InfoPaciente(
        nombre: 'Paciente Juan', tipo: 'paciente',
        plan: 'Dieta Proteica', activo: true, observaciones: 1,
        etiquetas: ['Buseta', 'TLS'],
      ),
      const InfoPaciente(
        nombre: 'Paciente María', tipo: 'paciente',
        plan: 'Dieta Keto', activo: true, observaciones: 3,
        etiquetas: ['PostgreSQL', 'Primary'],
      ),
      const InfoPaciente(
        nombre: 'Consultorio B', tipo: 'paciente',
        plan: '10.0.3.5', activo: false, observaciones: 0,
        etiquetas: ['Backup', 'Offsite'],
      ),
    ];

    final totalObservaciones = pacientes.fold(0, (s, d) => s + d.observaciones);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Distribución del Consultorio'),
        actions: [
          IconButton(icon: const Icon(Icons.filter_list), onPressed: () {}),
          IconButton(icon: const Icon(Icons.refresh),     onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          // Cabecera — Container con Row de ChipResumen (Pasos 1 + 3)
          Container(
            color:   Theme.of(context).colorScheme.surfaceContainerHighest,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                ChipResumen(
                  icono: Icons.spa,
                  texto: '${pacientes.length} pacientes',
                  color: Colors.indigo,
                ),
                const SizedBox(width: 16),
                ChipResumen(
                  icono: Icons.circle,
                  texto: '${pacientes.where((d) => d.activo).length} activos',
                  color: Colors.green,
                ),
                const SizedBox(width: 16),
                ChipResumen(
                  icono: Icons.warning_amber,
                  texto: '$totalObservaciones observaciones',
                  color: Colors.orange,
                ),
              ],
            ),
          ),

          // Lista — Expanded para que ocupe el espacio restante (Paso 3)
          Expanded(
            child: ListView.separated(
              padding:          const EdgeInsets.symmetric(vertical: 8),
              itemCount:        pacientes.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder:      (_, i)  => FilaPaciente(paciente: pacientes[i]),
            ),
          ),
        ],
      ),
    );
  }
}