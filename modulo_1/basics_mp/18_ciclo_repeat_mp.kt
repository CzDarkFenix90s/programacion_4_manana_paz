fun main() {
    println("Controles de Flujo Iteraciones, Ciclos repetitivos - Ciclo Repeat")
    println("Cuántas comidas registrar para calcular calorías diarias")

    val comidas = readLine()?.toIntOrNull() ?: 0
    var totalCalorias = 0

    repeat(comidas) { i ->
        println("Comida ${i + 1} (calorías consumidas)")
        val calorias = readLine()?.toIntOrNull() ?: 0
        totalCalorias += calorias
    }

    if (comidas > 0) {
        val promedio = totalCalorias / comidas
        println("Calorías promedio por comida: $promedio kcal")
        println("Clasificación: ${
            when {
                promedio < 300 -> "Baja"
                promedio <= 600 -> "Moderada"
                else -> "Alta"
            }
        }")
    } else {
        println("No se registraron comidas válidas.")
    }
}

//ejercicio en clase

fun main() {
    var totalAgua = 0
    var contador = 0

    repeat(6) {
        println("Ingresa cantidad de agua consumida (ml):")
        val agua = readLine()?.toIntOrNull() ?: 0
        totalAgua += agua

        if (agua >= 200) {
            contador++
        }
    }

    val promedio = totalAgua / 6
    println("Agua promedio diaria: $promedio ml")

    if (contador >= 3) {
        println("Hidratación adecuada")
    } else {
        println("Mejorar hidratación")
    }
}