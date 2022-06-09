class Correo {
  final String? nombre;
  final String? correo;
  final String? telefono;
  final String? sugerencia;

  Correo({
    required this.nombre,
    required this.correo,
    required this.telefono,
    required this.sugerencia,
  });

  factory Correo.fromJson(Map<String, dynamic> json) {
    return Correo(
      nombre: json['nombre'],
      correo: json['correo'],
      telefono: json['telefono'],
      sugerencia: json['sugerencia'],
    );
  }
}
