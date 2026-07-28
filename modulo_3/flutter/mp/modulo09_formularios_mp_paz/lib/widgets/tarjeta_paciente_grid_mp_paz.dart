// lib/widgets/tarjeta_paciente_grid_mp_paz.dart
import 'package:flutter/material.dart';
import '../models/paciente_ssh_mp_paz.dart';

class TarjetaPacienteGrid extends StatelessWidget {
  final PacienteSSH  bus;
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const TarjetaPacienteGrid({
    super.key,
    required this.bus,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs   = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Fila superior: icono + favorito
            Row(children: [
              Icon(
                Icons.restaurant,
                color: bus.clima ? cs.primary : cs.outline,
                size: 18,
              ),
              const Spacer(),
              GestureDetector(
                onTap: onFavorito,
                child: Icon(
                  bus.favorito ? Icons.star : Icons.star_border,
                  color: bus.favorito ? Colors.amber : cs.outline,
                  size: 18,
                ),
              ),
            ]),
            const SizedBox(height: 6),

            // Nombre e IP
            Text(
              bus.nombre,
              style: text.titleSmall?.copyWith(fontWeight: FontWeight.bold),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              bus.plan,
              style: text.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),

            const Spacer(),

            // Fila inferior: SSL + SO + eliminar
            Row(children: [
              if (bus.clima)
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Icon(Icons.ac_unit, size: 12, color: cs.primary),
                ),
              Expanded(
                child: Text(
                  bus.modelo,
                  style: text.labelSmall?.copyWith(color: cs.onSurfaceVariant),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: onEliminar,
                child: Icon(Icons.delete_outline, size: 16, color: cs.error),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}