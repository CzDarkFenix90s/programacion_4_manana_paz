void main() {
  String paciente = 'Lucia';

  String? plan = null;
  plan = 'Martinez';

  String? consulta;

  print(consulta?.length);

  String resultado = consulta ?? 'Sin consulta';
  print(resultado);

  if (plan != null) {
    print(plan.length);
  }

  late String token;
  token = 'abc123';
  print(token);
}