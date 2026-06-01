// Ejercicio de consulta dietética

void programarConsulta({
  required String paciente,
  required int edad,
  bool exigeControl = false,
  int sesiones = 1,
}) {
  final tipo = exigeControl ? 'control nutricional' : 'consulta inicial';
  print('$paciente ($edad años) agendó $tipo con $sesiones sesión(es).');
}

double calcularIMC(double peso, double altura, {bool redondear = false}) {
  final imc = peso / (altura * altura);
  return redondear ? double.parse(imc.toStringAsFixed(1)) : imc;
}

String mensajeNutricional(String nombre, {String objetivo = 'mantener peso'}) {
  return 'Hola $nombre, tu objetivo es $objetivo.';
}

void main() {
  programarConsulta(
    paciente: 'Lucía',
    edad: 28,
    exigeControl: true,
    sesiones: 3,
  );

  print(calcularIMC(62.0, 1.65));      // Resultado real
  print(calcularIMC(62.0, 1.65, redondear: true));

  print(mensajeNutricional('Carlos'));
  print(mensajeNutricional('Sofía', objetivo: 'bajar peso'));
}
