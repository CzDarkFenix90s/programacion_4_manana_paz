fun main() {
    println("Controles de Flujo")
    println("Condicional If - Multiples condiciones")
    println("Consumo de calorias diarias")
    
    val sistolica = readLine()?.toIntOrNull() ?: 0

    val clasificacion = if (sistolica <= 1200) {
        "Deficit calorico"
    } else if (sistolica <= 1800) {
        "Consumo bajo"
    } else if (sistolica <= 2200) {
        "Consumo normal"
    } else if (sistolica <= 2800) {
        "Consumo elevado"
    } else if (sistolica <= 3500) {
        "Exceso calorico"
    } else {
        "Riesgo alimenticio"
    }

    println("Clasificacion: $clasificacion")
    println("Clasificacion: ${clasificacion.uppercase()}")
}