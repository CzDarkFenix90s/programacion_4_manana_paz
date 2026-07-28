// lib/widgets/formulario_paciente_mp_paz.dart
import 'package:flutter/material.dart';

class FormularioPaciente extends StatefulWidget {
  final void Function(Map<String, String> datos) onGuardar;
  const FormularioPaciente({super.key, required this.onGuardar});

  @override
  State<FormularioPaciente> createState() => _FormularioPacienteState();
}

class _FormularioPacienteState extends State<FormularioPaciente> {
  final _formKey = GlobalKey<FormState>();

  // Controladores
  final _ctrlNombre  = TextEditingController();
  final _ctrlIp      = TextEditingController();
  final _ctrlPuerto  = TextEditingController(text: '40');
  final _ctrlNutriologo = TextEditingController(text: 'Dr. Paz');
  final _ctrlMac     = TextEditingController(); // <- Corregido: Controlador propio para MAC

  // FocusNodes para navegación de teclado
  final _focusIp      = FocusNode();
  final _focusPuerto  = FocusNode();
  final _focusNutriologo = FocusNode();
  final _focusMac     = FocusNode();

  // Variables de Estado
  String _so        = 'Dieta Keto';
  String _servicio  = 'Expreso'; // <- Corregido: Estado independiente para Servicios
  bool   _ssl       = true;

  // Expresión regular para validar IPv4 y MAC
  static final _regexIp  = RegExp(r'^(\d{1,3}\.){3}\d{1,3}$');
  static final _regexMac = RegExp(r'^([0-9A-Fa-f]{2}[:-]){5}([0-9A-Fa-f]{2})$');

  @override
  void dispose() {
    _ctrlNombre.dispose();
    _ctrlIp.dispose();
    _ctrlPuerto.dispose();
    _ctrlNutriologo.dispose();
    _ctrlMac.dispose();
    _focusIp.dispose();
    _focusPuerto.dispose();
    _focusNutriologo.dispose();
    _focusMac.dispose();
    super.dispose();
  }

  void _guardar() {
    if (!_formKey.currentState!.validate()) return;

    widget.onGuardar({
      'nombre':   _ctrlNombre.text.trim(),
      'ip':       _ctrlIp.text.trim(),
      'puerto':   _ctrlPuerto.text.trim(),
      'usuario':  _ctrlNutriologo.text.trim(),
      'mac':      _ctrlMac.text.trim(),
      'so':       _so,
      'servicio': _servicio,
      'ssl':      _ssl.toString(),
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView( // Cambiado a ListView para evitar desbordamiento (Overflow) al abrir teclado
        padding: const EdgeInsets.all(16.0),
        children: [

          // ── Nombre del Bus ───────────────────────────────────
          TextFormField(
            controller: _ctrlNombre,
            decoration: const InputDecoration(
              labelText:  'Nombre del paciente',
              hintText:   'Paciente Juan',
              prefixIcon: Icon(Icons.restaurant),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusIp.requestFocus(),
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'El nombre es obligatorio';
              if (v.length < 3)                  return 'Mínimo 3 caracteres';
              if (!RegExp(r'^[a-zA-Z0-9\-\_]+$').hasMatch(v)) {
                return 'Solo letras, números, guiones y guiones bajos';
              }
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Dirección IP ──────────────────────────────────────────
          TextFormField(
            controller:   _ctrlIp,
            focusNode:    _focusIp,
            decoration: const InputDecoration(
              labelText:  'Plan asignada (formato IP)',
              hintText:   '192.168.1.100',
              prefixIcon: Icon(Icons.map),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusPuerto.requestFocus(),
            validator: (v) {
              if (v == null || v.isEmpty) return 'La plan es obligatoria';
              if (!_regexIp.hasMatch(v))  return 'Formato IPv4 inválido (ej. 192.168.1.10)';
              final octetos = v.split('.').map(int.parse).toList();
              if (octetos.any((o) => o > 255)) return 'Octeto fuera de rango (0–255)';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Puerto ────────────────────────────────────────────
          TextFormField(
            controller:   _ctrlPuerto,
            focusNode:    _focusPuerto,
            decoration: const InputDecoration(
              labelText:  'Calorías Diarias (kcal)',
              prefixIcon: Icon(Icons.people),
              border:     OutlineInputBorder(),
            ),
            keyboardType:    TextInputType.number,
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusNutriologo.requestFocus(),
            validator: (v) {
              final capacidad = int.tryParse(v ?? '');
              if (capacidad == null)               return 'La capacidad debe ser un número';
              if (capacidad < 10 || capacidad > 200) return 'Calorías diarias inválida (ej. 10 a 200)';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Nutriologo ───────────────────────────────────────────────
          TextFormField(
            controller:      _ctrlNutriologo,
            focusNode:       _focusNutriologo,
            decoration: const InputDecoration(
              labelText:  'Nutriologo',
              prefixIcon: Icon(Icons.person_outline),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            onFieldSubmitted: (_) => _focusMac.requestFocus(),
            validator: (v) =>
                v == null || v.trim().isEmpty ? 'El nutriologo es obligatorio' : null,
          ),
          const SizedBox(height: 12),

          // ── Dirección MAC ──────────────────────────────────────────
          TextFormField(
            controller: _ctrlMac,
            focusNode:  _focusMac,
            decoration: const InputDecoration(
              labelText:  'Placa/Patente (formato MAC)',
              hintText:   '00:1A:2B:3C:4D:5E',
              prefixIcon: Icon(Icons.numbers),
              border:     OutlineInputBorder(),
            ),
            textInputAction: TextInputAction.next,
            validator: (v) {
              if (v == null || v.trim().isEmpty) return 'La patente es obligatoria';
              if (!_regexMac.hasMatch(v)) return 'Formato inválido (ej. AA:BB:CC:DD:EE:FF)';
              return null;
            },
          ),
          const SizedBox(height: 12),

          // ── Sistema Operativo ──────────────────────────────────────
          DropdownButtonFormField<String>(
            value:      _so,
            decoration: const InputDecoration(
              labelText:  'Modelo',
              prefixIcon: Icon(Icons.local_dining),
              border:     OutlineInputBorder(),
            ),
            items: [
              'Dieta Keto', 'Plan Vegano', 'BYD 2023',
              'Yutong 2021', 'Bajo en Carbohidratos',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _so = v!),
          ),
          const SizedBox(height: 12),

          // ── Servicios ──────────────────────────────────────────────
          DropdownButtonFormField<String>(
            value:      _servicio,
            decoration: const InputDecoration(
              labelText:  'Tipo de Servicio',
              prefixIcon: Icon(Icons.menu_book), // Icono cambiado para diferenciarlo de SO
              border:     OutlineInputBorder(),
            ),
            items: [
              'Expreso', 'Normal', 'Nocturno',
            ].map((s) => DropdownMenuItem(value: s, child: Text(s))).toList(),
            onChanged: (v) => setState(() => _servicio = v!), // Corregido: Asigna a _servicio
          ),
          const SizedBox(height: 8),

          // ── Aire Acondicionado — SwitchListTile ──────────────────────────────────
          SwitchListTile(
            title:     const Text('Aire Acondicionado'),
            subtitle:  const Text('Activar climatización'),
            value:     _ssl,
            onChanged: (v) => setState(() => _ssl = v),
            secondary: const Icon(Icons.ac_unit),
          ),
          const SizedBox(height: 16),

          // ── Botones ───────────────────────────────────────────────
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    _formKey.currentState?.reset();
                    _ctrlNombre.clear();
                    _ctrlIp.clear();
                    _ctrlMac.clear();
                    _ctrlPuerto.text = '40';
                    _ctrlNutriologo.text = 'Dr. Paz';
                  },
                  child: const Text('Limpiar'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                flex: 2,
                child: FilledButton.icon(
                  onPressed: _guardar,
                  icon:  const Icon(Icons.save),
                  label: const Text('Guardar bus'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}