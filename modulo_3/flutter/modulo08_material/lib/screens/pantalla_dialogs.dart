// lib/screens/pantalla_dialogs.dart
import 'package:flutter/material.dart';

class PantallaDialogs extends StatelessWidget {
  const PantallaDialogs({super.key});

  // ── MÉTODOS DE SNACKBAR ──────────────────────────────────────────
  void _mostrarSnackBar(BuildContext context, {required String mensaje, bool esError = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(mensaje),
        backgroundColor: esError ? Theme.of(context).colorScheme.error : null,
        action: SnackBarAction(
          label: 'Deshacer',
          onPressed: () {},
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        duration: const Duration(seconds: 3),
      ),
    );
  }

  // ── MÉTODOS DE ALERTAS Y DIÁLOGOS ─────────────────────────────────
  
  // Alerta Informativa Dinámica (Reutilizable para evitar duplicar código)
  void _mostrarAlertaInformativa({
    required BuildContext context,
    required String titulo,
    required String contenido,
    IconData icono = Icons.info_outline,
    Color? colorIcono,
  }) {
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: Icon(icono, color: colorIcono ?? Theme.of(context).colorScheme.primary, size: 32),
        title: Text(titulo),
        content: Text(contenido),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Entendido'),
          ),
        ],
      ),
    );
  }

  // Alerta de Confirmación (Eliminar)
  Future<void> _mostrarConfirmacion(BuildContext context) async {
    final confirmar = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        icon: const Icon(Icons.warning_amber, color: Colors.orange, size: 32),
        title: const Text('Eliminar servidor'),
        content: const Text(
          '¿Estás seguro de que deseas eliminar prod-web-01?\n'
          'Esta acción no se puede deshacer.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
            ),
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Eliminar'),
          ),
        ],
      ),
    );

    if (!context.mounted) return;

    if (confirmar == true) {
      _mostrarSnackBar(context, mensaje: 'Servidor eliminado correctamente');
    }
  }

  // Diálogo con Formulario
  Future<void> _mostrarFormulario(BuildContext context) async {
    final formKey = GlobalKey<FormState>();
    final ctrlNombre = TextEditingController();
    final ctrlIp = TextEditingController();

    await showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Agregar servidor'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: ctrlNombre,
                decoration: const InputDecoration(labelText: 'Nombre'),
                validator: (v) => v == null || v.isEmpty ? 'Campo requerido' : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: ctrlIp,
                decoration: const InputDecoration(labelText: 'Dirección IP'),
                validator: (v) {
                  if (v == null || v.isEmpty) return 'Campo requerido';
                  final partes = v.split('.');
                  if (partes.length != 4) return 'Formato: 192.168.1.1';
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancelar'),
          ),
          FilledButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                Navigator.pop(ctx);
              }
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );

    if (!context.mounted) return;
    
    if (ctrlNombre.text.isNotEmpty) {
      _mostrarSnackBar(context, mensaje: 'Servidor "${ctrlNombre.text}" agregado');
    }

    // Limpieza de controladores para evitar fugas de memoria (Memory Leaks)
    ctrlNombre.dispose();
    ctrlIp.dispose();
  }

  // ── DISEÑO DE LA PANTALLA (BUILD) ─────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar y Dialogs'),
        backgroundColor: cs.surfaceContainerHighest,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // ── Sección SnackBar ──────────────────────────────────────
          Text('SnackBar', style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: () => _mostrarSnackBar(context, mensaje: '¡Operación realizada con éxito!'),
            icon: const Icon(Icons.check_circle_outline),
            label: const Text('SnackBar de éxito'),
          ),
          const SizedBox(height: 8),
          FilledButton.icon(
            onPressed: () => _mostrarSnackBar(context, mensaje: 'Boton nuevo presionado'),
            icon: const Icon(Icons.touch_app_outlined),
            label: const Text('Nuevo Boton'),
          ),
          const SizedBox(height: 8),
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: cs.error,
              foregroundColor: cs.onError,
            ),
            onPressed: () => _mostrarSnackBar(context, mensaje: 'Error: no se pudo conectar al servidor', esError: true),
            icon: const Icon(Icons.error_outline),
            label: const Text('SnackBar de error'),
          ),

          const Divider(height: 32),

          // ── Sección AlertDialog / Alertas ──────────────────────────
          Text('Alertas y Diálogos', style: text.labelLarge?.copyWith(color: cs.primary)),
          const SizedBox(height: 12),
          
          // Alerta Informativa 1
          FilledButton.icon(
            onPressed: () => _mostrarAlertaInformativa(
              context: context,
              titulo: 'Actualización del Sistema',
              contenido: 'Se ha programado un mantenimiento para las 02:00 AM. Por favor, guarde todos sus cambios.',
              colorIcono: Colors.blue,
            ),
            icon: const Icon(Icons.info_outline),
            label: const Text('Alerta Mantenimiento'),
          ),
          const SizedBox(height: 8),
          
          // Alerta Informativa 2 (Boton nuevo)
          FilledButton.icon(
            style: FilledButton.styleFrom(
              backgroundColor: cs.tertiary,
              foregroundColor: cs.onTertiary,
            ),
            onPressed: () => _mostrarAlertaInformativa(
              context: context,
              titulo: 'Nuevo botón implementado',
              contenido: 'Hiciste clic en el botón nuevo. Por favor, guarde todos sus cambios.',
              colorIcono: cs.tertiary,
            ),
            icon: const Icon(Icons.ads_click),
            label: const Text('Boton nuevo 2'),
          ),
          const SizedBox(height: 8),
          
          // Alerta de Confirmación
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: cs.error,
              side: BorderSide(color: cs.error),
            ),
            onPressed: () => _mostrarConfirmacion(context),
            icon: const Icon(Icons.delete_outline),
            label: const Text('Eliminar servidor (Confirmación)'),
          ),
          const SizedBox(height: 8),
          
          // Diálogo con Formulario
          FilledButton.tonal(
            onPressed: () => _mostrarFormulario(context),
            child: const Text('Agregar servidor (Formulario)'),
          ),
        ],
      ),
    );
  }
}