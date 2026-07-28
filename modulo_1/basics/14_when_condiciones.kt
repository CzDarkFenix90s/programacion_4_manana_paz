fun main() {
    println("Controles de Flujo: Calculo de Copago")
    
    print("Edad del paciente: ")
    val edadPaciente = readLine()?.toIntOrNull() ?: 0
    
    print("¿Tiene Seguro? (s/n): ")
    val tieneSeguro = readLine()?.trim()?.lowercase() == "s"

    val nivelSeguro = if (tieneSeguro) {
        print("Nivel del seguro (BASICO/INTERMEDIO/PREMIUM): ")
        readLine()?.trim()?.uppercase() ?: ""
    } else ""
    val copago = when {
        !tieneSeguro -> 30.0
        nivelSeguro == "PREMIUM" -> 0.0
        nivelSeguro == "INTERMEDIO" -> 10.0
        nivelSeguro == "BASICO" -> 20.0
        edadPaciente < 18 -> 0.0
        edadPaciente > 65 -> 15.0
        else -> 30.0
    }
    println("Copago a pagar: $${"%.2f".format(copago)}")
}

