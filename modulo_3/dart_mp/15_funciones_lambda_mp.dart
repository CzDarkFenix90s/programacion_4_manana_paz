void main() {
  final alimentos = ['Avena', 'Pollo', 'Brocoli', 'Yogur'];

  final etiquetas = alimentos.map((alimento) => 'Consumir $alimento').toList();
  print(etiquetas);

  final calorias = [150, 240, 55, 120];

  final caloriasDobles = calorias.map((c) => c * 2).toList();
  print(caloriasDobles);

  final calcularEnergia = (double gramosCarbs, double gramosProteina) {
    final carbohidratos = gramosCarbs * 4;
    final proteinas = gramosProteina * 4;
    return carbohidratos + proteinas;
  };
  print(calcularEnergia(30.0, 20.0));

  final ordenarPorCalorias = (int a, int b) => b.compareTo(a);
  calorias.sort(ordenarPorCalorias);
  print(calorias);
}