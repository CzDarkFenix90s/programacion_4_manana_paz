void main() {
  List<String> alimentos = ['manzana', 'platano', 'fresa'];
  var numeros = [1, 2, 3, 4, 5];

  print(alimentos[0]);
  print(alimentos.length);
  alimentos.add('aguacate');
  alimentos.remove('platano');

  Map<String, int> edades = {
    'Lucia': 28,
    'Luis': 34,
    'Maria': 25,
  };

  print(edades['Lucia']);
  print(edades['Pedro']);
  edades['Carlos'] = 40;

  Set<String> tags = {'dieta', 'nutricion', 'consulta'};
  tags.add('dieta');
  print(tags.length);

  var lista1 = [1, 2, 3];
  var lista2 = [4, 5, 6];
  var combinada = [...lista1, ...lista2];
  print(combinada);

  bool mostrarExtra = true;
  var items = [
    'elemento1',
    'elemento2',
    if (mostrarExtra) 'elemento3',
  ];
  print(items);

  var cuadrados = [for (var i = 1; i <= 5; i++) i * i];
  print(cuadrados);
}