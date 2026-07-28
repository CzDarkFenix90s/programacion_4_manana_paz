// lib/main_mp_paz.dart
import 'package:flutter/material.dart';
import 'package:modulo09_formularios_mp_paz/models/paciente_ssh_mp_paz.dart';
import 'package:modulo09_formularios_mp_paz/screens/pantalla_busqueda_mp_paz.dart';
import 'package:modulo09_formularios_mp_paz/screens/pantalla_pacientes_mp_paz.dart';
import 'package:modulo09_formularios_mp_paz/widgets/fila_paciente_mp_paz.dart';
import 'package:modulo09_formularios_mp_paz/widgets/formulario_paciente_mp_paz.dart';

const int paso = 5;

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF1B5E20),
    ),
    useMaterial3: true,
  ),
  home: switch (paso) {
    1 => const _Paso1(),
    2 => const _Paso2(),
    3 => const _Paso3(),
    4 => const PantallaPacientes(),
    5 => const PantallaBusqueda(),
    _ => Scaffold(
        body: Center(child: Text('Paso $paso: crea el widget primero'))),
  },
));

// ─── Paso 1 ────────────────────────────────────────
class _Paso1 extends StatefulWidget {
  const _Paso1();
  @override
  State<_Paso1> createState() => _Paso1State();
}

class _Paso1State extends State<_Paso1> {
  final _ctrlHostname = TextEditingController();
  final _ctrlIp       = TextEditingController();
  final _ctrlPuerto   = TextEditingController(text: '40');
  final _focusIp      = FocusNode();
  final _focusPuerto  = FocusNode();

  @override
  void dispose() {
    _ctrlHostname.dispose();
    _ctrlIp.dispose();
    _ctrlPuerto.dispose();
    _focusIp.dispose();
    _focusPuerto.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title:           const Text('Conexión a Central'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller:      _ctrlHostname,
              decoration:      const InputDecoration(
                labelText:  'Nombre del paciente',
                hintText:   'Paciente Juan',
                prefixIcon: Icon(Icons.restaurant),
                border:     OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusIp.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:      _ctrlIp,
              focusNode:       _focusIp,
              decoration:      const InputDecoration(
                labelText:  'Plan de dieta (ID)',
                hintText:   '192.168.1.100',
                prefixIcon: Icon(Icons.map),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.next,
              onSubmitted:     (_) => _focusPuerto.requestFocus(),
            ),
            const SizedBox(height: 12),
            TextField(
              controller:  _ctrlPuerto,
              focusNode:   _focusPuerto,
              decoration:  const InputDecoration(
                labelText:  'Calorías Diarias (kcal)',
                prefixIcon: Icon(Icons.people),
                border:     OutlineInputBorder(),
              ),
              keyboardType:    TextInputType.number,
              textInputAction: TextInputAction.done,
              onSubmitted:     (_) => FocusScope.of(context).unfocus(),
            ),
            const SizedBox(height: 20),
            FilledButton.icon(
              onPressed: () {
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Conectando a ${_ctrlHostname.text} '
                      '(${_ctrlIp.text}:${_ctrlPuerto.text})',
                    ),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
              },
              icon:  const Icon(Icons.contact_phone),
              label: const Text('Contactar'),
            ),
            const SizedBox(height: 8),
            OutlinedButton(
              onPressed: () {
                _ctrlHostname.clear();
                _ctrlIp.clear();
                _ctrlPuerto.text = '40';
              },
              child: const Text('Limpiar campos'),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── Paso 2 ────────────────────────────────────────
class _Paso2 extends StatelessWidget {
  const _Paso2();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title:           const Text('Nuevo bus'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: FormularioPaciente(
        onGuardar: (datos) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                  'Bus Guardado: ${datos['nombre']} — Plan ${datos['ip']} (Calorías: ${datos['puerto']})'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        },
      ),
    );
  }
}

// ─── Paso 3 ────────────────────────────────────────
class _Paso3 extends StatefulWidget {
  const _Paso3();
  @override
  State<_Paso3> createState() => _Paso3State();
}

class _Paso3State extends State<_Paso3> {
  // Nota: Si tus clases heredan de un modelo base común (ej. 'Bus'), 
  // cambia el tipo de la lista de 'dynamic' al nombre de la clase padre.
  final List<dynamic> _pacientes = [
    PacienteSSH(id:'1', nombre:'Paciente Juan',  plan:'Dieta Proteica',   capacidad:40,   nutriologo:'Pedro Gómez',   modelo:'Dieta Keto', clima:true,  favorito:true),
    PacienteSSH(id:'2', nombre:'Paciente María',   plan:'Dieta Keto',   capacidad:40,   nutriologo:'Sofía López', modelo:'Plan Vegano',    clima:true),
    PacienteSSH(id:'3', nombre:'Paciente Carlos',  plan:'Plan Vegano',   capacidad:50, nutriologo:'Dr. Paz',   modelo:'Dieta Keto', clima:false),
    PacienteSSH(id:'4', nombre:'Paciente Ana',  plan:'Dieta Detox', capacidad:40,   nutriologo:'Dr. Paz',  modelo:'Bajo en Carbohidratos', clima:false),
   
    ServiciosWeb(id1:'5', nombre:'Plan Nocturna', plan:'Plan N1', capacidad:60,   nutriologo:'Danna Gonzalez', favorito: false),
  ];

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title:           Text('Pacientes (${_pacientes.length})'),
        backgroundColor: cs.primaryContainer,
        foregroundColor: cs.onPrimaryContainer,
      ),
      body: _pacientes.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.restaurant_outlined, size: 56, color: cs.onSurfaceVariant),
                  const SizedBox(height: 12),
                  Text('Sin pacientes registrados', style: TextStyle(color: cs.onSurfaceVariant)),
                ],
              ),
            )
          : ListView.separated(
              itemCount:        _pacientes.length,
              separatorBuilder: (_, __) => const Divider(height: 1, indent: 72),
              itemBuilder: (ctx, i) {
                final item = _pacientes[i];
                return FilaPaciente(
                  bus: item,
                  onFavorito: () {
                    setState(() {
                      // Modifica de manera segura basándose en la propiedad real del objeto
                      item.favorito = !item.favorito;
                    });
                  },
                  onEliminar: () {
                    setState(() {
                      _pacientes.removeAt(i);
                    });
                  },
                );
              },
            ),
    );
  }
}
