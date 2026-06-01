// Ejercicio de consulta dietética

class PlanNutricional {
  String nombre;
  int caloriasDiarias;

  PlanNutricional(this.nombre, this.caloriasDiarias);

  int ajustarCalorias(int ajuste) {
    return caloriasDiarias + ajuste;
  }

  @override
  String toString() {
    return 'PlanNutricional(nombre: $nombre, calorías diarias: $caloriasDiarias)';
  }
}

void main() {
  final plan = PlanNutricional('Control de peso', 1800);
  print(plan);
  print('Calorías con ajuste +200: ${plan.ajustarCalorias(200)} kcal');
}
