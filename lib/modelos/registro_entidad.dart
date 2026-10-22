class RegistroEntidad {
  final String id;
  final String nombre;
  final String nivelRiesgo; // Bajo, Medio, Alto, Crítico
  final String metodoCaptura; // Ej: Escaneo QR, IA Cámara, Geolocalización
  final double similitud;
  final bool activo;
  final DateTime fecha;

  RegistroEntidad({
    required this.id,
    required this.nombre,
    required this.nivelRiesgo,
    required this.metodoCaptura,
    this.similitud = 0.0,
    this.activo = true,
    DateTime? fecha,
  }) : fecha = fecha ?? DateTime.now();
}