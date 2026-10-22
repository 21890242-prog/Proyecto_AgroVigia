import 'package:flutter/material.dart';
import '../modelos/registro_entidad.dart';

class CapturaCamaraIaScreen extends StatefulWidget {
  @override
  _CapturaCamaraIaScreenState createState() => _CapturaCamaraIaScreenState();
}

class _CapturaCamaraIaScreenState extends State<CapturaCamaraIaScreen> {
  bool _analizando = false;
  bool _detectado = false;

  void _simularEscaneo() {
    setState(() => _analizando = true);
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _analizando = false;
        _detectado = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('IA - Detección Visual de Riesgo')),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black87,
              child: Center(
                child: _analizando
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(color: Colors.greenAccent),
                          SizedBox(height: 16),
                          Text('Analizando entorno con IA...', style: TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      )
                    : _detectado
                        ? Container(
                            padding: EdgeInsets.all(16),
                            decoration: BoxDecoration(border: Border.all(color: Colors.greenAccent, width: 3)),
                            child: Text('¡Riesgo Identificado!\nFuga de presión detectada', textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                          )
                        : Icon(Icons.camera, color: Colors.white54, size: 100),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (!_detectado)
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(padding: EdgeInsets.all(16), backgroundColor: Colors.blue),
                    onPressed: _analizando ? null : _simularEscaneo,
                    icon: Icon(Icons.camera_enhance, color: Colors.white),
                    label: Text('Capturar y Analizar', style: TextStyle(fontSize: 16, color: Colors.white)),
                  )
                else
                  ElevatedButton.styleFrom().runtimeType == ElevatedButton
                      ? ElevatedButton(
                          style: ElevatedButton.styleFrom(padding: EdgeInsets.all(16), backgroundColor: Colors.green),
                          onPressed: () {
                            final entidad = RegistroEntidad(
                              id: 'IA-${DateTime.now().millisecond}',
                              nombre: 'Fuga de presión en válvula principal',
                              nivelRiesgo: 'Alto',
                              metodoCaptura: 'Cámara IA',
                              similitud: 0.95,
                              activo: true,
                            );
                            Navigator.pop(context, entidad);
                          },
                          child: Text('Confirmar y Guardar Riesgo', style: TextStyle(fontSize: 16, color: Colors.white)),
                        )
                      : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}