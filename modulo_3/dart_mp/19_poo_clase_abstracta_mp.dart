// Ejercicio de consulta dietética

abstract class EvaluacionNutricional {
  String get tipo;
  String analizar();

  void describir() {
    print('$tipo → ${analizar()}');
  }
}

class EvaluacionIMC extends EvaluacionNutricional {
  final double peso;
  final double altura;

  EvaluacionIMC(this.peso, this.altura);

  @override
  String get tipo => 'IMC';

  @override
  String analizar() {
    final imc = peso / (altura * altura);
    if (imc < 18.5) return 'Bajo peso';
    if (imc < 25) return 'Peso normal';
    return 'Sobrepeso';
  }
}

class EvaluacionMacro extends EvaluacionNutricional {
  final int carbohidratos;
  final int proteinas;
  final int grasas;

  EvaluacionMacro(this.carbohidratos, this.proteinas, this.grasas);

  @override
  String get tipo => 'Macros';

  @override
  String analizar() {
    return 'Carbs: $carbohidratos g, Proteínas: $proteinas g, Grasas: $grasas g';
  }
}

void main() {
  final evaluaciones = <EvaluacionNutricional>[ 
    EvaluacionIMC(62.0, 1.65),
    EvaluacionMacro(200, 120, 70),
  ];

  for (final evaluacion in evaluaciones) {
    evaluacion.describir();
  }
}
