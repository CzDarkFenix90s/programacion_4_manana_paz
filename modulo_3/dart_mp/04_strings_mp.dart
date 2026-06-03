void main() {
  final paciente = 'Lucia';
  final edad = 28;

  print('Hola paciente, $paciente');

  print('${paciente.toUpperCase()} tiene ${edad + 1} anos el proximo ano');

  final tarjeta = '''
Nombre: $paciente
Edad:   $edad
Mayor:  ${edad >= 18 ? 'Si' : 'No'}
  ''';
  print(tarjeta);

  final ruta = r'C:\Users\Lucia\Documents';
  print(ruta);

  final saludo = 'Hola paciente, ' + paciente + '!';
  print(saludo);

  print('dieta'.toUpperCase());
  print('  Flutter  '.trim());
  print('Flutter'.contains('lut'));
  print('Flutter'.replaceAll('t', 'T'));
  print('a,b,c'.split(','));
  print('Flutter'.substring(0, 4));
  print('Flutter'.startsWith('Flu'));
  print('abc'.padLeft(5, '0'));
}