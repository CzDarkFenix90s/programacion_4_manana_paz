fun main() {
    println("Controles de Flujo: Determinación de Tipo de Dieta")

    print("Edad del paciente: ")
    val edadPaciente = readLine()?.toIntOrNull() ?: 0

    print("¿Tiene plan de dieta? (s/n): ")
    val tienePlanDieta = readLine()?.trim()?.lowercase() == "s"

    val nivelPlan = if (tienePlanDieta) {
        print("Nivel del plan (BASICO/INTERMEDIO/PREMIUM): ")
        readLine()?.trim()?.uppercase() ?: ""
    } else ""

    val tipoDieta = when {
        !tienePlanDieta -> "GENERAL"
        nivelPlan == "PREMIUM" -> "PERSONALIZADA"
        nivelPlan == "INTERMEDIO" -> "BALANCEADA"
        nivelPlan == "BASICO" -> "BASICA"
        edadPaciente < 18 -> "JUVENIL"
        edadPaciente > 65 -> "SENIOR"
        else -> "ESTANDAR"
    }

    println("Tipo de dieta recomendada: $tipoDieta")
}

