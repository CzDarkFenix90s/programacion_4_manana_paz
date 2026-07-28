// lib/providers/metricas_provider_mp_paz.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/metrica_paciente_mp_paz.dart';

class MetricasNotifier extends AsyncNotifier<List<MetricaPaciente>> {
  // build() puede ser async — es la carga inicial
  @override
  Future<List<MetricaPaciente>> build() => _fetch();

  Future<List<MetricaPaciente>> _fetch() async {
    await Future.delayed(const Duration(milliseconds: 800));
    return const [
      MetricaPaciente(bus:'Paciente Juan', imcGrasa:45.2, calorias:62.1, consultas:230, combustible: 80),
      MetricaPaciente(bus:'Paciente María',  imcGrasa:88.1, calorias:91.2, consultas:80, combustible: 120),
      MetricaPaciente(bus:'Paciente Carlos', imcGrasa:22.4, calorias:41.0, consultas:50, combustible: 60),
      MetricaPaciente(bus:'Paciente José', imcGrasa:20.0, calorias:12.0, consultas:20, combustible: 40),
      MetricaPaciente(bus:'Paciente Clara',  imcGrasa:5.0, calorias:9.0, consultas:5, combustible: 20),
    ];
  }

  Future<void> recargar() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(_fetch);
  }
}

final metricasProvider =
    AsyncNotifierProvider<MetricasNotifier, List<MetricaPaciente>>(
  MetricasNotifier.new,
);