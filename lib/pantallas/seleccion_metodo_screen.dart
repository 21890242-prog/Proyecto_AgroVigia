import 'package:flutter/material.dart';
import 'captura_camara_ia_screen.dart';
import 'escaneo_qr_screen.dart';
import 'catalogo_rapido_screen.dart';

class SeleccionMetodoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Seleccionar Método de Captura')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Identifique el riesgo de forma automatizada sin necesidad de escribir:',
              style: TextStyle(fontSize: 16, color: Colors.grey.shade700),
            ),
            SizedBox(height: 24),
            _buildOpcionCard(
              context,
              titulo: 'Análisis de Imagen por IA (Cámara)',
              sub: 'Detecta anomalías automáticamente usando el lente',
              icono: Icons.camera_alt,
              color: Colors.blue,
              destino: CapturaCamaraIaScreen(),
            ),
            SizedBox(height: 16),
            _buildOpcionCard(
              context,
              titulo: 'Escaneo de Código QR / Etiqueta',
              sub: 'Obtén los datos del equipo y riesgo escaneando un código',
              icono: Icons.qr_code_scanner,
              color: Colors.teal,
              destino: EscaneoQrScreen(),
            ),
            SizedBox(height: 16),
            _buildOpcionCard(
              context,
              titulo: 'Selección Rápida de Catálogo',
              sub: 'Elige de una lista preconfigurada de incidencias comunes',
              icono: Icons.list_alt,
              color: Colors.orange,
              destino: CatalogoRapidoScreen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOpcionCard(BuildContext context, {required String titulo, required String sub, required IconData icono, required Color color, required Widget destino}) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () async {
          final resultado = await Navigator.push(context, MaterialPageRoute(builder: (context) => destino));
          if (resultado != null) {
            Navigator.pop(context, resultado);
          }
        },
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Row(
            children: [
              CircleAvatar(backgroundColor: color.withOpacity(0.2), radius: 28, child: Icon(icono, color: color, size: 28)),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(titulo, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(height: 4),
                    Text(sub, style: TextStyle(color: Colors.grey.shade600, fontSize: 13)),
                  ],
                ),
              ),
              Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}