fun main() {
    println("Controles de Flujo")
    println("Condicional If")
    print("Incluir calorias consumidas: ")
    val temperatura = readLine()?.toDoubleOrNull() ?: 2000.0
    if (temperatura >= 3000.0) {
        println("Exceso de calorias: ajustar dieta")
    } else if (temperatura >= 2000.0) {
        println("Consumo adecuado: mantener plan alimenticio")
    } else {
        println("Bajo consumo: aumentar ingesta")
    }
    println("calorias registradas: $temperatura")
}