// lib/screens/pantalla_pacientes_mp_paz.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modulo10_riverpod_mp_paz/models/paciente_ssh_mp_paz.dart';
import '../providers/pacientes_provider_mp_paz.dart';

class PantallaPacientes extends ConsumerWidget {
  const PantallaPacientes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pacientes = ref.watch(pacientesProvider);
    final cs         = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Pacientes (${pacientes.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: pacientes.isEmpty
          ? const Center(child: Text('Sin pacientes'))
          : ListView.separated(
              itemCount:        pacientes.length,
              separatorBuilder: (_, __) =>
                  const Divider(height: 1, indent: 72),
              itemBuilder: (context, i) {
                final s = pacientes[i];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: s.clima
                        ? Colors.green.shade50
                        : Colors.grey.shade100,
                    child: Icon(Icons.restaurant,
                        color: s.clima ? Colors.green : Colors.grey),
                  ),
                  title:    Text(s.nombre,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  subtitle: Text('Plan: ${s.plan} | Calorías: ${s.capacidad}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(
                          s.favorito ? Icons.star : Icons.star_border,
                          color: s.favorito ? Colors.amber : null,
                        ),
                        onPressed: () => ref
                            .read(pacientesProvider.notifier)
                            .toggleFavorito(s.id),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete_outline,
                            color: Colors.red),
                        onPressed: () => ref
                            .read(pacientesProvider.notifier)
                            .eliminar(s.id),
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final id = DateTime.now().millisecondsSinceEpoch.toString();
          ref.read(pacientesProvider.notifier).agregar(
            PacienteSSH(
              id:     id,
              nombre: 'nuevo-bus-$id',
              plan:     'Plan ${pacientes.length + 1}',
              capacidad: 40,
              clima:    true,
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}