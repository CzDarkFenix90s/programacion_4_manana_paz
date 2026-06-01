// Ejercicio de consulta dietética
void main() {
  final paciente = 'Lucía';
  final edad   = 28;

  // Interpolación con $ (igual que en Kotlin)
  print('Hola paciente, $paciente');                    // Hola paciente, Lucía

  // Expresión con ${ }
  print('${paciente.toUpperCase()} tiene ${edad + 1} años el próximo año');

  // String multilinea con triple comillas
  final tarjeta = '''
Nombre: $paciente
Edad:   $edad
Mayor:  ${edad >= 18 ? 'Sí' : 'No'}
  ''';
  print(tarjeta);

  // Raw string — ignora el escape y la interpolación
  final ruta = r'C:\Users\Lucía\Documents';  // el \ no se interpreta
  print(ruta);

  // Concatenación (menos idiomático — preferir interpolación)
  final saludo = 'Hola paciente, ' + paciente + '!';

  // Métodos útiles de String
  print('dieta'.toUpperCase());           // FLUTTER
  print('  Flutter  '.trim());              // Flutter
  print('Flutter'.contains('lut'));         // true
  print('Flutter'.replaceAll('t', 'T'));    // FluTTer
  print('a,b,c'.split(','));                // [a, b, c]
  print('Flutter'.substring(0, 4));         // Flut
  print('Flutter'.startsWith('Flu'));       // true
  print('abc'.padLeft(5, '0'));             // 00abc
}

no amor tranquila chi 