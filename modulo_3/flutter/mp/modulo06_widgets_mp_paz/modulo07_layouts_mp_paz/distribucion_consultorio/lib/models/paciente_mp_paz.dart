class InfoPaciente {
  final String       nombre;
  final String       tipo;       // 'nutricionista', 'recepcion', 'paciente', 'cita'
  final String plan;
  final bool         activo;
  final int          observaciones;
  final List<String> etiquetas;

  const InfoPaciente({
    required this.nombre,
    required this.tipo,
    required this.plan,
    required this.activo,
    this.observaciones   = 0,
    this.etiquetas = const [],
  });
}