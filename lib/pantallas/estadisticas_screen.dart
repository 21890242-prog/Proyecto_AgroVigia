import 'package:flutter/material.dart';
import '../modelos/registro_entidad.dart';

class EstadisticasScreen extends StatelessWidget {
  final List<RegistroEntidad> registros;

  EstadisticasScreen({required this.registros});

  @override
  Widget build(BuildContext context) {
    int criticos = registros.where((r) => r.nivelRiesgo == 'Crítico' || r.nivelRiesgo == 'Alto').length;
    int normales = registros.length - criticos;

    return Scaffold(
      appBar: AppBar(title: Text('Analítica y Reportes')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Resumen General de Operaciones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Card(
                    color: Colors.red.shade50,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text('Críticos / Altos', style: TextStyle(color: Colors.red.shade800, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('$criticos', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.red)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Card(
                    color: Colors.green.shade50,
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text('Bajos / Medios', style: TextStyle(color: Colors.green.shade800, fontWeight: FontWeight.bold)),
                          SizedBox(height: 8),
                          Text('$normales', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Text('Métodos de Captura Utilizados', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.camera_alt, color: Colors.blue),
                    title: Text('Cámara IA'),
                    trailing: Text('${registros.where((r) => r.metodoCaptura == 'Cámara IA').length} registros', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    leading: Icon(Icons.qr_code_scanner, color: Colors.teal),
                    title: Text('Escaneo QR'),
                    trailing: Text('${registros.where((r) => r.metodoCaptura == 'Escaneo QR').length} registros', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    leading: Icon(Icons.list_alt, color: Colors.orange),
                    title: Text('Catálogo Rápido'),
                    trailing: Text('${registros.where((r) => r.metodoCaptura == 'Catálogo Rápido').length} registros', style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}