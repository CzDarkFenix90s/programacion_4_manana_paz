fun main() {
    println("Controles de Flujo When - con condiciones arbitrarias")

    print("Edad del paciente: ")
    val edadPaciente = readLine()?.toIntOrNull() ?: 0

    print("¿Tiene plan de dieta personalizado? (s/n): ")
    val tienePlanPersonalizado = readLine()?.trim()?.lowercase() == "s"

    val nivelActividad = if (tienePlanPersonalizado) {
        println("Nivel de actividad física (BAJA/MODERADA/ALTA):")
        readLine()?.trim()?.uppercase() ?: ""
    } else ""

    print("¿Tiene condiciones de salud especiales? (obesidad/hipertension/ninguna): ")
    val condicionSalud = readLine()?.trim()?.lowercase() ?: "ninguna"

    val caloriasDiarias = when {
        !tienePlanPersonalizado && edadPaciente < 18 -> 2000
        !tienePlanPersonalizado && edadPaciente >= 65 -> 1800
        !tienePlanPersonalizado -> 2200
        nivelActividad == "BAJA" && condicionSalud == "obesidad" -> 1500
        nivelActividad == "MODERADA" && condicionSalud == "hipertension" -> 1800
        nivelActividad == "ALTA" -> 2500
        condicionSalud == "obesidad" -> 1600
        else -> 2000
    }

    println("Calorías diarias recomendadas: $caloriasDiarias kcal")
}