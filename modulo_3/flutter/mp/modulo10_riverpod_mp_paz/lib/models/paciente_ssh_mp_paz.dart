// lib/models/paciente_ssh_mp_paz.dart
class PacienteSSH {
  final String id;
  final String nombre;
  final String plan;
  final int capacidad;
  final bool clima;
  bool         favorito;

  PacienteSSH({
    required this.id,
    required this.nombre,
    required this.plan,
    required this.capacidad,
    required this.clima,
    this.favorito = false,
  });
}