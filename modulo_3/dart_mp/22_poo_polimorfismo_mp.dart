abstract class Alimento {
  String get nombre;
  double calcularCalorias();
}

class AlimentoProteico extends Alimento {
  final double gramos;
  AlimentoProteico(this.gramos);

  @override
  String get nombre => 'Proteina';

  @override
  double calcularCalorias() => gramos * 4;
}

class AlimentoCarbohidrato extends Alimento {
  final double gramos;
  AlimentoCarbohidrato(this.gramos);

  @override
  String get nombre => 'Carbohidrato';

  @override
  double calcularCalorias() => gramos * 4;
}

class AlimentoGrasa extends Alimento {
  final double gramos;
  AlimentoGrasa(this.gramos);

  @override
  String get nombre => 'Grasa';

  @override
  double calcularCalorias() => gramos * 9;
}

void imprimirCalorias(Alimento alimento) {
  print('${alimento.nombre}: ${alimento.calcularCalorias().toStringAsFixed(1)} kcal');
}

void main() {
  final porciones = <Alimento>[
    AlimentoProteico(30),
    AlimentoCarbohidrato(50),
    AlimentoGrasa(15),
  ];

  for (final alimento in porciones) {
    imprimirCalorias(alimento);
  }

  final masCalorico = porciones.reduce((a, b) => a.calcularCalorias() > b.calcularCalorias() ? a : b);
  print('\nAlimento mas calorico: ${masCalorico.nombre}');
}