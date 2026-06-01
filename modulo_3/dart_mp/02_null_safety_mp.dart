// Ejercicio de consulta dietética
void main() {
  // Tipo no-nullable — NUNCA puede ser null
  String paciente = 'Lucía';
  // paciente = null;       // ERROR de compilación

  // Tipo nullable — puede ser null (añadir ?)
  String? plan = null;   // OK
  plan = 'Martínez';       // OK

  // Operadores de null safety
  String? consulta;

  // ?. — safe call (igual que en Kotlin)
  print(consulta?.length);      // null — no lanza excepción

  // ?? — operador Elvis (igual que ?: en Kotlin)
  String resultado = consulta ?? 'Sin consulta';
  print(resultado);           // Sin consulta

  // ! — non-null assertion (igual que !! en Kotlin) — úsalo con precaución
  String consultaSegura = consulta!;  // lanza si consulta es null

  // Null check con if
  if (plan != null) {
    print(plan.length);   // smart cast — ya es String aquí
  }

  // late — inicialización diferida (como lateinit en Kotlin)
  late String token;
  token = 'abc123';           // debe asignarse antes de usar
  print(token);
}