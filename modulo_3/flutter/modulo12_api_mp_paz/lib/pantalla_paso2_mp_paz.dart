import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'cita_dto_mp_paz.dart';

class PantallaPaso2 extends StatelessWidget {
  const PantallaPaso2({super.key});

  Future<List<CitaDto>> _fetchCitas() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/todos?_limit=15'),
    );
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => CitaDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 2 · DTO simple'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<CitaDto>>(
        future: _fetchCitas(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final citas = snap.data!;
          return Column(
            children: [
              // Resumen con chips
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Chip(
                      label: Text(
                          '${citas.where((t) => t.completed).length} completados'),
                      backgroundColor: Colors.green[100],
                    ),
                    const SizedBox(width: 8),
                    Chip(
                      label: Text(
                          '${citas.where((t) => !t.completed).length} pendientes'),
                      backgroundColor: Colors.orange[100],
                    ),
                  ],
                ),
              ),
              // Lista de citas
              Expanded(
                child: ListView.builder(
                  itemCount: citas.length,
                  itemBuilder: (context, i) {
                    final t = citas[i];
                    return CheckboxListTile(
                      title: Text(t.title),
                      subtitle: Text('ID: ${t.id}'),
                      value: t.completed,
                      onChanged: null, // solo lectura por ahora
                      activeColor: Colors.green,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}