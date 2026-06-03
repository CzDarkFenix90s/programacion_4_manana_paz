// Ejercicio de consulta dietética
void main() {
  // var — tipo inferido (como val en Kotlin)
  var paciente = 'Lucía';           // String
  var edad   = 28;              // int
  var precio = 89.99;           // double
  var activo = true;            // bool

  // Tipo explícito
  String plan = 'Martínez';
  int    stock    = 100;
  double pi       = 3.14159;
  bool   visible  = false;

  // final — no se puede reasignar (como val en Kotlin)
  final consulta = 'Consulta Dietética';
  // consulta = 'Barcelona';  // ERROR — final no se puede reasignar

  // const — constante en tiempo de compilación (como const en Kotlin)
  const gravedad = 9.8;
  const pi2      = 3.14159;

  // Diferencia clave: final vs const
  final ahora  = DateTime.now();   // OK — se evalúa en runtime
  // const ahora = DateTime.now(); // ERROR — DateTime.now() no es constante de compilación

  print('$paciente $plan tiene $edad años en $consulta');
}