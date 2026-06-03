fun main() {
    println("Controles de Flujo Iteraciones, Ciclos repetitivos - Ciclo Repeat")
    println("Cuantas pulsaciones tomar para calcular frecuencia cardiaca")
    
    val mediciones = readLine()?.toIntOrNull() ?: 0
    var totalPulsaciones = 0

    repeat(mediciones) { i ->
        println("medicion ${i + 1} (pulsos en 15 seg.)")
        val pulsos = readLine()?.toIntOrNull() ?: 0
        totalPulsaciones += pulsos * 4//para 60 segs.
    }

    if (mediciones > 0) {
        val promedio = totalPulsaciones / mediciones
        println("Frecuencia cardiaca promedio: $promedio lpm")
        println("Clasificacion: ${
            when {
                promedio < 60 -> "Bradicardia"
                promedio <= 100 -> "Normal"
                else -> "Taquicardia"
            }
        }")
    } else {
        println("No se ingresaron mediciones válidas.")
    }
}

//ejercicio en clase

fun main() {

    var totalFiebre = 0
    var contador = 0

    repeat(6) { 
        println("Ingresa tu temperatura:")
        val temperatura = readLine()?.toDoubleOrNull() ?: 0.0
        totalFiebre += temperatura.toInt()

        if (temperatura <= 38.5) {
            contador++
        }
    }

    val promedio = totalFiebre / 6
    println("Temperatura promedio: $promedio °C")

    if (contador > 0) {
        println("Hubo fiebre sostenida")
    } else {
        println("No hubo fiebre sostenida")
    }
}