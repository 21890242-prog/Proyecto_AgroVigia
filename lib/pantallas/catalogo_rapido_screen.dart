import 'package:flutter/material.dart';
import '../modelos/registro_entidad.dart';

class CatalogoRapidoScreen extends StatelessWidget {
  final List<Map<String, dynamic>> _catalogo = [
    {'nombre': 'Obstrucción en ruta de evacuación', 'riesgo': 'Alto'},
    {'nombre': 'Falta de equipo de protección (EPP)', 'riesgo': 'Medio'},
    {'nombre': 'Exposición a químicos sin rotular', 'riesgo': 'Crítico'},
    {'nombre': 'Iluminación deficiente en pasillo', 'riesgo': 'Bajo'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catálogo Rápido de Riesgos')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: _catalogo.length,
        itemBuilder: (context, index) {
          final item = _catalogo[index];
          return Card(
            margin: EdgeInsets.only(bottom: 12),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: Icon(Icons.bookmark_outline, color: Colors.orange),
              title: Text(item['nombre'], style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text('Nivel predeterminado: ${item['riesgo']}'),
              trailing: Icon(Icons.check_circle_outline, color: Colors.green),
              onTap: () {
                final entidad = RegistroEntidad(
                  id: 'CAT-${index + 100}',
                  nombre: item['nombre'],
                  nivelRiesgo: item['riesgo'],
                  metodoCaptura: 'Catálogo Rápido',
                  similitud: 1.0,
                  activo: true,
                );
                Navigator.pop(context, entidad);
              },
            ),
          );
        },
      ),
    );
  }
}