// lib/models/paciente_ssh_mp_paz.dart
class PacienteSSH {
  final String id;
  final String nombre;
  final String plan;
  final int capacidad;
  final String nutriologo;
  final String modelo;
  final bool clima;
  bool         favorito;    // mutable — puede cambiar sin recrear el objeto

  PacienteSSH({
    required this.id,
    required this.nombre,
    required this.plan,
    required this.capacidad,
    required this.nutriologo,
    required this.modelo,
    required this.clima,
    this.favorito = false,
  });

  
}

class ServiciosWeb {
  final String id1;
  final String nombre;
  final String plan;
  final int capacidad;
  final String nutriologo;

  bool         favorito;    // mutable — puede cambiar sin recrear el objeto

  ServiciosWeb({
    required this.id1,
    required this.nombre,
    required this.plan,
    required this.capacidad,
    required this.nutriologo,
    this.favorito = false,
  });

  
}