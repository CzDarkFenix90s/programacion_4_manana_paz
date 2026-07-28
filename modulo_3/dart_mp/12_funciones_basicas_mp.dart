import 'dart:io';

int calcularCaloriasMeta(int peso, int factor) {
  return peso * factor;
}

int calcularCarbohidratos(int calorias, int porcentaje) => ((calorias * porcentaje) ~/ 100) ~/ 4;

void imprimirSeccionDietetica(String titulo) {
  print('--- CLINICA NUTRICIONAL: $titulo ---');
}

String formatearPlan(String paciente, int calorias) => 'Paciente: $paciente | Meta: $calorias kcal';

formatearPlanSinTipo(String paciente, int calorias) => 'Paciente: $paciente | Meta: $calorias kcal';

void main() {
  int caloriasTotales = calcularCaloriasMeta(70, 30);
  int carbohidratosGramos = calcularCarbohidratos(caloriasTotales, 40);

  imprimirSeccionDietetica('PLAN DIETETICO DIARIO');
  print('Calorias calculadas: $caloriasTotales kcal');
  print('Carbohidratos diarios: $carbohidratosGramos g');

  print(formatearPlan('Lucia Martinez', caloriasTotales));
  print(formatearPlanSinTipo('Carlos Ruiz', 1800));
}