fun main() {
    println("Controles de Flujo when con condiciones arbitrarias")
    println("Nombre del Paciente")
    val nombrePaciente = readLine()?.trim()?.lowercase() ?: "Sin Identificacion"
    println("Severidad de alergia/intolerancia (CRITICA/GRAVE/MODERADA/LEVE)")
    val severidad = readLine()?.trim()?.uppercase() ?: ""


    when (severidad) {
        "CRITICA" -> {
            println("ALERTA CRITICA: Paciente: $nombrePaciente")
            println("Llamar al nutricionista de guardia")
            println("Activar protocolo de emergencia alimentaria")
        }
        "GRAVE" -> {
            println("GRAVE: Paciente: $nombrePaciente")
            println("Priorizar consulta inmediata")
            println("Reevaluar en 30 minutos")
        }
        "MODERADA" -> println("Moderada: Paciente: $nombrePaciente - ajustar menú")
        "LEVE" -> println("Leve: Paciente: $nombrePaciente - continuar con plan normal")
        else -> println("Severidad no reconocida")
    }
}