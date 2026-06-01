// Ejercicio de consulta dietética

class HistorialAlimenticio {
  double _caloriasTotales;

  HistorialAlimenticio(this._caloriasTotales);

  double get caloriasTotales => _caloriasTotales;

  void registrarComida(double calorias) {
    if (calorias <= 0) {
      print('Las calorías deben ser mayores a 0');
      return;
    }
    _caloriasTotales += calorias;
    print('Registrado: ${calorias.toStringAsFixed(0)} kcal');
  }

  void eliminarComida(double calorias) {
    if (calorias <= 0) {
      print('Las calorías deben ser mayores a 0');
      return;
    }
    if (calorias > _caloriasTotales) {
      print('No hay suficientes calorías registradas');
      return;
    }
    _caloriasTotales -= calorias;
    print('Eliminado: ${calorias.toStringAsFixed(0)} kcal');
  }
}

void main() {
  final historial = HistorialAlimenticio(1200.0);

  historial.registrarComida(450.0);
  historial.eliminarComida(200.0);
  print('Calorías totales del día: ${historial.caloriasTotales.toStringAsFixed(0)} kcal');
}
