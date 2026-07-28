// lib/providers/pacientes_provider_mp_paz.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart' show StateProvider;
import '../models/paciente_ssh_mp_paz.dart';

// NotifierProvider — estado complejo con métodos propios
class PacientesNotifier extends Notifier<List<PacienteSSH>> {
  @override
  List<PacienteSSH> build() => [
    PacienteSSH(id:'1', nombre:'Paciente Juan', plan:'Dieta Proteica', capacidad:22,   clima:true,  favorito:true),
    PacienteSSH(id:'2', nombre:'Paciente María',  plan:'Dieta Keto', capacidad:22,   clima:true),
    PacienteSSH(id:'3', nombre:'Paciente Carlos', plan:'Plan Vegano', capacidad:2222, clima:false),
    PacienteSSH(id:'4', nombre:'Paciente Ana',  plan:'Dieta Detox', capacidad:40, clima:false)
  ];

  void toggleFavorito(String id) {
    state = state.map((s) =>
        s.id == id
          ? PacienteSSH(id:s.id, nombre:s.nombre, plan:s.plan,
                        capacidad:s.capacidad, clima:s.clima,
                        favorito:!s.favorito)
          : s
    ).toList();
  }

  void eliminar(String id) {
    state = state.where((s) => s.id != id).toList();
  }

  void agregar(PacienteSSH bus) {
    state = [...state, bus];
  }
}

final pacientesProvider =
    NotifierProvider<PacientesNotifier, List<PacienteSSH>>(
  PacientesNotifier.new,
);

// Filtro de búsqueda — estado primitivo
final busquedaProvider = StateProvider<String>((ref) => '');

// Provider DERIVADO — se recalcula cuando cualquiera de sus dependencias cambia
final pacientesFiltradosProvider = Provider<List<PacienteSSH>>((ref) {
  final todos    = ref.watch(pacientesProvider);
  final busqueda = ref.watch(busquedaProvider);

  if (busqueda.isEmpty) return todos;

  final q = busqueda.toLowerCase();
  return todos.where((s) =>
      s.nombre.toLowerCase().contains(q) || s.plan.contains(q)
  ).toList();
  // Cuando 'pacientesProvider' o 'busquedaProvider' cambian,
  // este provider se recalcula automáticamente.
});