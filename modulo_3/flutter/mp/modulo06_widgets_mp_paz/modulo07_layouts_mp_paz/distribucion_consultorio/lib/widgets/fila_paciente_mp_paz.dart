import 'package:flutter/material.dart';
import '../models/paciente_mp_paz.dart';
import 'avatar_badge_mp_paz.dart';

class FilaPaciente extends StatelessWidget {
  final InfoPaciente paciente;

  const FilaPaciente({super.key, required this.paciente});

  IconData get _icono => switch (paciente.tipo) {
    'nutricionista'   => Icons.map,
    'recepcion'   => Icons.room,
    'paciente'   => Icons.restaurant,
    'cita' => Icons.local_dining,
    _          => Icons.devices,
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          // AvatarBadgePaciente — Stack del Paso 4
          AvatarBadgePaciente(
            nombre:  paciente.nombre,
            observaciones: paciente.observaciones,
            activo:  paciente.activo,
          ),

          const SizedBox(width: 12),

          // Column: nombre, IP y Wrap de etiquetas
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        paciente.nombre,
                        style:    const TextStyle(fontWeight: FontWeight.bold),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Icon(_icono, size: 16, color: Colors.grey.shade500),
                  ],
                ),
                Text(paciente.plan,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600)),
                const SizedBox(height: 6),
                Wrap(
                  spacing: 4, runSpacing: 4,
                  children: paciente.etiquetas.map((tag) =>
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color:        Colors.indigo.shade50,
                        borderRadius: BorderRadius.circular(4),
                        border:       Border.all(color: Colors.indigo.shade200),
                      ),
                      child: Text(tag,
                          style: TextStyle(
                              fontSize:   10,
                              color:      Colors.indigo.shade700,
                              fontWeight: FontWeight.w500)),
                    ),
                  ).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}