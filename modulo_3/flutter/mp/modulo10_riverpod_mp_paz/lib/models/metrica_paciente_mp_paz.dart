// lib/models/metrica_servidor_mp_paz.dart
class MetricaPaciente {
  final String bus;
  final double imcGrasa;
  final double calorias;
  final int consultas;
  final double combustible;

  const MetricaPaciente({
    required this.bus,
    required this.imcGrasa,
    required this.calorias,
    required this.consultas,
    required this.combustible,
  });
}