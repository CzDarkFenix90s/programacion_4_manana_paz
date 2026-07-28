import 'package:flutter/material.dart';

class FilaPaciente extends StatelessWidget {
  final dynamic bus; 
  final VoidCallback onFavorito;
  final VoidCallback onEliminar;

  const FilaPaciente({
    super.key,
    required this.bus,
    required this.onFavorito,
    required this.onEliminar,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final bool tieneSsl = _verificarSsl(bus);
    final bool esFavorito = bus.favorito ?? false;

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: tieneSsl
            ? cs.primaryContainer
            : cs.surfaceContainerHighest,
        child: Icon(
          Icons.restaurant,
          color: tieneSsl ? cs.onPrimaryContainer : cs.onSurfaceVariant,
        ),
      ),
      title: Text(
        bus.nombre,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        'Nutri: ${bus.nutriologo} | Plan: ${bus.plan} | Calorías: ${bus.capacidad}',
        style: TextStyle(fontSize: 12, color: cs.onSurfaceVariant),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: Icon(
              esFavorito ? Icons.star : Icons.star_border,
              color: esFavorito ? Colors.amber : cs.outline,
            ),
            onPressed:     onFavorito,
            visualDensity: VisualDensity.compact,
            tooltip:       esFavorito ? 'Quitar favorito' : 'Agregar a favoritos',
          ),
          IconButton(
            icon:          Icon(Icons.delete_outline, color: cs.error),
            onPressed:     onEliminar,
            visualDensity: VisualDensity.compact,
            tooltip:       'Eliminar',
          ),
        ],
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    );
  }

  bool _verificarSsl(dynamic objeto) {
    try {
      return objeto.clima ?? false;
    } catch (_) {
      return false;
    }
  }
}