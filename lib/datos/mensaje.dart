class Mensaje {
  final String texto;
  final DateTime fecha;

  Mensaje(this.texto, this.fecha);

  Mensaje.fromJson(Map<String, dynamic> json)
      : texto = json['texto'],
        fecha = DateTime.parse(json['fecha']);

  Map<String, dynamic> toJson() => {
    'texto': texto,
    'fecha': fecha.toIso8601String(),
  };
}
