void programarConsulta({
  required String paciente,
  required int edad,
  bool exigeControl = false,
  int sesiones = 1,
}) {
  final tipo = exigeControl ? 'control nutricional' : 'consulta inicial';
  print('$paciente ($edad anos) agendo $tipo con $sesiones sesion(es).');
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
    paciente: 'Lucia',
    edad: 28,
    exigeControl: true,
    sesiones: 3,
  );

  print(calcularIMC(62.0, 1.65));
  print(calcularIMC(62.0, 1.65, redondear: true));

  print(mensajeNutricional('Carlos'));
  print(mensajeNutricional('Sofia', objetivo: 'bajar peso'));
}