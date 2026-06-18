void main() {
  String codigoHttp = '404';

  switch (codigoHttp) {
    case '200':
      print('OK');
    case '201':
      print('Creado');
    case '400':
      print('Peticion incorrecta');
    case '401':
      print('No autorizado');
    case '404':
      print('No encontrado');
    case '500':
      print('Error del servidor');
    default:
      print('Codigo desconocido');
  }

  String descripcion = switch (codigoHttp) {
    '200' => 'OK — solicitud exitosa',
    '201' => 'Created — recurso creado',
    '204' => 'No Content — sin contenido',
    '400' => 'Bad Request — datos invalidos',
    '401' => 'Unauthorized — sin autenticacion',
    '403' => 'Forbidden — sin permiso',
    '404' => 'Not Found — recurso no existe',
    '500' => 'Internal Server Error',
    '503' => 'Service Unavailable',
    _     => 'Codigo HTTP desconocido',
  };
  print(descripcion);

  int codigoNumerico = 404;

  String categoria = switch (codigoNumerico) {
    200 || 201 || 204        => 'Exito (2xx)',
    301 || 302 || 307        => 'Redireccion (3xx)',
    400 || 401 || 403 || 404 => 'Error del cliente (4xx)',
    500 || 502 || 503        => 'Error del servidor (5xx)',
    _                        => 'Desconocido',
  };
  print(categoria);

  double temperatura = 39.2;

  String alerta = switch (temperatura) {
    double t when t >= 40.0 => 'CRITICO — llame a emergencias',
    double t when t >= 38.5 => 'FIEBRE ALTA — consulte medico',
    double t when t >= 37.5 => 'FIEBRE LEVE — descanse',
    double t when t >= 36.0 => 'NORMAL',
    _                       => 'HIPOTERMIA — abrigese',
  };
  print(alerta);
}