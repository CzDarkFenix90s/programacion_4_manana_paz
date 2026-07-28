List<double> transformarComidas(
  List<double> calorias,
  double Function(double) transformacion,
) {
  return calorias.map(transformacion).toList();
}

void procesarComidas(
  List<double> calorias,
  void Function(double) accion,
) {
  for (final comida in calorias) {
    accion(comida);
  }
}

void main() {
  final calorias = [320.0, 420.0, 150.0, 280.0];

  final planDiario = transformarComidas(calorias, (c) => c * 0.9);
  print(planDiario);

  final altos = calorias.where((c) => c > 300).toList();
  print(altos);

  print('Registro de comidas:');
  procesarComidas(calorias, (c) => print('Comida: ${c.toStringAsFixed(0)} kcal'));
}