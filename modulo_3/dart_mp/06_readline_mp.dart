import 'dart:io';

void main() {
  print('Ingrese el nombre del paciente: ');
  String? paciente = stdin.readLineSync();
  print('Hola paciente, $paciente');

  print('Ingrese un numero entero:');
  int numero = int.parse(stdin.readLineSync()!);
  print('El numero: $numero');

  print('Ingrese un decimal:');
  double valor = double.parse(stdin.readLineSync()!);
  print('El decimal: $valor');

  print('Ingrese el primer numero:');
  int a = int.parse(stdin.readLineSync()!);
  print('Ingrese el segundo numero:');
  int b = int.parse(stdin.readLineSync()!);
  int suma = a + b;
  print('La suma de $a y $b es: $suma');
}