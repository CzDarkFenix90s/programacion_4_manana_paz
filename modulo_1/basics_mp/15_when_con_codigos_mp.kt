fun main() {
    println("Controles de Flujo When - con bloque de codigos")

    println("Nombre del Paciente")
    val nombrePaciente = readLine()?.trim()?.lowercase() ?: "Sin identificacion"
    println("Severidad de alergia/intolerancia (CRITICA/GRAVE/MODERADA/LEVE)")
    val severidad = readLine()?.trim()?.uppercase() ?: ""

    when (severidad) {
        "CRITICA" -> {
            println("ALERTA CRITICA: Paciente: $nombrePaciente")
            println("Llamar al nutricionista de guardia")
            println("Activar el protocolo de emergencia alimentaria")
        }

        "GRAVE" -> {
            println("GRAVE: Paciente: $nombrePaciente")
            println("Priorizar consulta inmediata")
            println("Reevaluar en 30 minutos")
        }

        "MODERADA" -> println("Moderada: paciente: $nombrePaciente - ajustar menú")
        "LEVE" -> println("Leve: paciente: $nombrePaciente continuar con plan normal")
        else -> println("severidad no reconocida")
    }
}