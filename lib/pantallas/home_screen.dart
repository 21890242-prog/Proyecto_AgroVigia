import 'package:flutter/material.dart';
import '../modelos/registro_entidad.dart';
import 'seleccion_metodo_screen.dart';
import 'estadisticas_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<RegistroEntidad> _registros = [
    RegistroEntidad(
      id: 'R001',
      nombre: 'Zona Norte - Sobrecalentamiento de Motor',
      nivelRiesgo: 'Crítico',
      metodoCaptura: 'Cámara IA',
      similitud: 0.92,
      activo: true,
    ),
    RegistroEntidad(
      id: 'R002',
      nombre: 'Acceso Bodega B - Código QR Dañado',
      nivelRiesgo: 'Medio',
      metodoCaptura: 'Escaneo QR',
      similitud: 0.45,
      activo: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Control Inteligente de Riesgos', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: Icon(Icons.bar_chart),
            tooltip: 'Ver Estadísticas',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EstadisticasScreen(registros: _registros)),
              );
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tarjeta de Resumen Superior
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: [Colors.indigo.shade800, Colors.indigo.shade500]),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Riesgos Activos', style: TextStyle(color: Colors.white70, fontSize: 14)),
                    SizedBox(height: 4),
                    Text('${_registros.length} Registrados', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                  ],
                ),
                Icon(Icons.security, color: Colors.white, size: 40),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Text('Últimas Detecciones', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _registros.length,
              itemBuilder: (context, index) {
                final reg = _registros[index];
                Color colorRiesgo = reg.nivelRiesgo == 'Crítico' ? Colors.red : Colors.orange;
                return Card(
                  elevation: 2,
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: colorRiesgo.withOpacity(0.2),
                      child: Icon(Icons.warning_amber_rounded, color: colorRiesgo),
                    ),
                    title: Text(reg.nombre, style: TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text('Método: ${reg.metodoCaptura} | Similitud: ${(reg.similitud * 100).toStringAsFixed(0)}%'),
                    trailing: Chip(
                      label: Text(reg.nivelRiesgo, style: TextStyle(color: Colors.white, fontSize: 12)),
                      backgroundColor: colorRiesgo,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          final nuevoRegistro = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SeleccionMetodoScreen()),
          );
          if (nuevoRegistro != null && nuevoRegistro is RegistroEntidad) {
            setState(() {
              _registros.insert(0, nuevoRegistro);
            });
          }
        },
        icon: Icon(Icons.add_a_photo),
        label: Text('Identificar Riesgo'),
      ),
    );
  }
}