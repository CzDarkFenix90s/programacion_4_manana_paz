void main() {
  final protocolos = ['HTTP', 'HTTPS', 'FTP', 'SSH', 'SMTP'];

  for (final protocolo in protocolos) {
    print(protocolo);
  }

  protocolos.forEach((p) => print(p.toLowerCase()));

  final puertos = {'HTTP': 80, 'HTTPS': 443, 'SSH': 22, 'FTP': 21};
  for (final entrada in puertos.entries) {
    print('${entrada.key} -> puerto ${entrada.value}');
  }
}