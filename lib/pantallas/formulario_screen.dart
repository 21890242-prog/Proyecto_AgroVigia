import 'package:flutter/material.dart';
import '../modelos/registro_entidad.dart';

class FormularioScreen extends StatefulWidget {
  @override
  _FormularioScreenState createState() => _FormularioScreenState();
}

class _FormularioScreenState extends State<FormularioScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();
  final _idController = TextEditingController();
  
  String _nivelRiesgoSeleccionado = 'Bajo';
  double _similitudValor = 0.0;
  bool _activoEstado = true;

  final List<String> _nivelesRiesgo = ['Bajo', 'Medio', 'Alto', 'Crítico'];

  @override
  void dispose() {
    _nombreController.dispose();
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registro de Datos')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Campo ID
              TextFormField(
                controller: _idController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'ID de Registro',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un ID válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Campo Nombre o Identificador
              TextFormField(
                controller: _nombreController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Nombre o Identificador',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un nombre válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),

              // Selector de Nivel de Riesgo
              DropdownButtonFormField<String>(
                value: _nivelRiesgoSeleccionado,
                decoration: InputDecoration(
                  labelText: 'Nivel de Riesgo',
                  border: OutlineInputBorder(),
                ),
                items: _nivelesRiesgo.map((String nivel) {
                  return DropdownMenuItem<String>(
                    value: nivel,
                    child: Text(nivel),
                  );
                }).toList(),
                onChanged: (String? nuevoValor) {
                  setState(() {
                    _nivelRiesgoSeleccionado = nuevoValor!;
                  });
                },
              ),
              SizedBox(height: 16.0),

              // Deslizador (Slider) para Similitud
              Text('Similitud: ${_similitudValor.toStringAsFixed(2)}'),
              Slider(
                value: _similitudValor,
                min: 0.0,
                max: 1.0,
                divisions: 100,
                label: _similitudValor.toStringAsFixed(2),
                onChanged: (double valor) {
                  setState(() {
                    _similitudValor = valor;
                  });
                },
              ),
              SizedBox(height: 8.0),

              // Interruptor (Switch) para Estado Activo
              SwitchListTile(
                title: Text('Registro Activo'),
                value: _activoEstado,
                onChanged: (bool valor) {
                  setState(() {
                    _activoEstado = valor;
                  });
                },
              ),
              SizedBox(height: 24.0),

              // Botón Guardar
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Creación de la entidad con los datos capturados
                    final nuevoRegistro = RegistroEntidad(
                      id: _idController.text.trim(),
                      nombre: _nombreController.text.trim(),
                      nivelRiesgo: _nivelRiesgoSeleccionado,
                      metodoCaptura: 'Formulario Manual',
                      similitud: _similitudValor,
                      activo: _activoEstado,
                    );

                    // Retorna el objeto a la pantalla anterior
                    Navigator.pop(context, nuevoRegistro);
                  }
                },
                child: Text('Guardar', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}