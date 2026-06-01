// Ejercicio de consulta dietética
void main() {
  // Forma básica
  int temperatura = 38;

  if (temperatura > 37.5) {
    print('Fiebre');
  } else if (temperatura > 36) {
    print('Normal');
  } else {
    print('Hipotermia');
  }

  // Operador ternario — para decisiones de una línea
  // condición ? valorSiVerdadero : valorSiFalso
  String estado = temperatura > 37.5 ? 'Con fiebre' : 'Sin fiebre';
  print(estado);

  // null-aware con ternario
  String? consulta;
  String display = consulta != null ? consulta.toUpperCase() : 'Sin consulta';

  // Forma más concisa con ??
  String display2 = consulta?.toUpperCase() ?? 'Sin consulta';
  print(display2);  // Sin consulta
}

void main() {
  String? paciente;

  // Sin verificar — error de compilación
  // print(paciente.length);  // ERROR: paciente puede ser null

  // Forma 1 — verificación explícita
  if (paciente != null) {
    print(paciente.length);  // aquí Dart sabe que paciente es String
  }

  // Forma 2 — operador ?.
  print(paciente?.length);  // null, sin excepción

  // Forma 3 — valor por defecto
  int longitud = paciente?.length ?? 0;
  print(longitud);  // 0
}

