import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

import 'nutriologo_dto_mp_paz.dart';

class PantallaPaso2Users extends StatelessWidget {
  const PantallaPaso2Users({super.key});

  Future<List<NutriologoDto>> _fetchNutriologos() async {
    final res = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/users?_limit=15'),
    );
    final lista = jsonDecode(res.body) as List<dynamic>;
    return lista
        .map((e) => NutriologoDto.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paso 2 · DTO Nutriologos'),
        leading: BackButton(onPressed: () => context.go('/')),
      ),
      body: FutureBuilder<List<NutriologoDto>>(
        future: _fetchNutriologos(),
        builder: (context, snap) {
          if (snap.connectionState != ConnectionState.done) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }

          final nutriologos = snap.data!;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Chip(
                      label: Text('${nutriologos.length} pacientes'),
                      backgroundColor: Colors.blue[100],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: nutriologos.length,
                  itemBuilder: (context, i) {
                    final nutriologo = nutriologos[i];
                    return ListTile(
                      title: Text(nutriologo.name),
                      subtitle: Text(nutriologo.email),
                      leading: CircleAvatar(
                        child: Text(nutriologo.id.toString()),
                      ),
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