class Dieta {
  final String nombre;
  final int duracionSemanas;

  Dieta(this.nombre, this.duracionSemanas);

  String obtenerObjetivo() => 'Definir objetivo';

  void mostrarPlan() {
    print('Plan: $nombre | Duracion: $duracionSemanas semanas | Objetivo: ${obtenerObjetivo()}');
  }
}

class DietaHipertrofia extends Dieta {
  DietaHipertrofia(super.nombre, super.duracionSemanas);

  @override
  String obtenerObjetivo() => 'Aumentar masa muscular';

  void calcularSuperavit() => print('Calculando superavit calorico para $nombre');
}

class DietaDefinicion extends Dieta {
  DietaDefinicion(super.nombre, super.duracionSemanas);

  @override
  String obtenerObjetivo() => 'Reducir porcentaje de grasa';

  void calcularDeficit() => print('Calculando deficit calorico para $nombre');
}

void main() {
  final dietaVolumen = DietaHipertrofia('Volumen Limpio', 12);
  final dietaCorte = DietaDefinicion('Definicion Sostenible', 8);

  dietaVolumen.mostrarPlan();
  dietaCorte.mostrarPlan();

  dietaVolumen.calcularSuperavit();
  dietaCorte.calcularDeficit();
}