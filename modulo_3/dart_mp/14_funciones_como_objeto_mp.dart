double sumarCalorias(double a, double b) => a + b;
double restarCalorias(double a, double b) => a - b;

double aplicarCalculoCalorias(
  double valor1,
  double valor2,
  double Function(double, double) operacion,
) {
  return operacion(valor1, valor2);
}

double Function(double) crearAjustePorcentaje(double porcentaje) {
  return (double valor) => valor * (1 + porcentaje / 100);
}

void main() {
  final operacion = sumarCalorias;
  print(operacion(350.0, 120.0));

  print(aplicarCalculoCalorias(2200.0, 500.0, restarCalorias));
  print(aplicarCalculoCalorias(1800.0, 200.0, (a, b) => a + b));

  final ajustarPorcentaje = crearAjustePorcentaje(10);
  print(ajustarPorcentaje(1800.0));
}