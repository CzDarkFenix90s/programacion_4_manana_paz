// Ejercicio de consulta dietética

class ConsultaNutricional {
  final String paciente;
  final String objetivo;
  final int sesiones;
  final bool seguimiento;

  ConsultaNutricional({
    required this.paciente,
    required this.objetivo,
    required this.sesiones,
    this.seguimiento = false,
  });

  ConsultaNutricional.inicial()
      : paciente = 'Nuevo paciente',
        objetivo = 'Evaluación inicial',
        sesiones = 1,
        seguimiento = false;

  ConsultaNutricional.express({required this.paciente})
      : objetivo = 'Consulta express',
        sesiones = 1,
        seguimiento = false;

  factory ConsultaNutricional.desdePerfil(String perfil) {
    if (perfil == 'deportivo') {
      return ConsultaNutricional(
        paciente: 'Atleta',
        objetivo: 'Aumentar masa muscular',
        sesiones: 6,
        seguimiento: true,
      );
    }
    return ConsultaNutricional(
      paciente: 'Cliente',
      objetivo: 'Control de peso',
      sesiones: 4,
    );
  }

  @override
  String toString() {
    return 'ConsultaNutricional(paciente: $paciente, objetivo: $objetivo, sesiones: $sesiones, seguimiento: $seguimiento)';
  }
}

void main() {
  final consulta1 = ConsultaNutricional(
    paciente: 'María',
    objetivo: 'Bajar peso',
    sesiones: 5,
    seguimiento: true,
  );
  final consulta2 = ConsultaNutricional.inicial();
  final consulta3 = ConsultaNutricional.desdePerfil('deportivo');

  print(consulta1);
  print(consulta2);
  print(consulta3);
}
