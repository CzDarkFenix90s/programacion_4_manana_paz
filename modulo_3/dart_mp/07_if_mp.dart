void main() {
  int temperatura = 38;

  if (temperatura > 37.5) {
    print('Fiebre');
  } else if (temperatura > 36) {
    print('Normal');
  } else {
    print('Hipotermia');
  }

  String estado = temperatura > 37.5 ? 'Con fiebre' : 'Sin fiebre';
  print(estado);

  String? consulta;
  String display = consulta != null ? consulta.toUpperCase() : 'Sin consulta';
  print(display);

  String display2 = consulta?.toUpperCase() ?? 'Sin consulta';
  print(display2);

  String? paciente;

  if (paciente != null) {
    print(paciente.length);
  }

  print(paciente?.length);

  int longitud = paciente?.length ?? 0;
  print(longitud);
}