import 'package:flutter/material.dart';
import '../modelos/registro_entidad.dart';

class EscaneoQrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Escáner de Código QR')),
      body: Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.qr_code_scanner, size: 120, color: Colors.teal),
            SizedBox(height: 24),
            Text('Apunta la cámara al código QR del activo o equipo industrial', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.grey.shade700)),
            SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.all(16), backgroundColor: Colors.teal),
              onPressed: () {
                // Simulación de lectura exitosa de QR
                final entidad = RegistroEntidad(
                  id: 'QR-8842',
                  nombre: 'Tablero eléctrico principal - Sobrecorriente',
                  nivelRiesgo: 'Crítico',
                  metodoCaptura: 'Escaneo QR',
                  similitud: 0.99,
                  activo: true,
                );
                Navigator.pop(context, entidad);
              },
              child: Text('Simular Lectura Exitosa de QR', style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}