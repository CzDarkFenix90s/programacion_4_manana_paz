import 'package:flutter/material.dart';
import 'screens/pantalla_distribucion_mp_paz.dart';

void main() => runApp(const AppDistribucion());

class AppDistribucion extends StatelessWidget {
  const AppDistribucion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:                      'Distribución del Consultorio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme:  ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const PantallaDistribucion(),
    );
  }
}