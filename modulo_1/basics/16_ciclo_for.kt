fun main() {
    println("--- Controles de Flujo: Iteraciones y Ciclos Repetitivos ---")

    println("\nFor con rango (1..10):")
    for (i in 1..10) {
        println("5 x $i = ${i * 5}")
    }
    
    println("\nFor con until (1 until 10):")
    for (i in 1 until 10) {
        println(i)
    }
    
    println("\nFor con pasos (1..10 step 3):")
    for (i in 1..10 step 3) {
        println(i)
    }
    
    println("\nFor descendente (10 downTo 1):")
    for (i in 10 downTo 1) {
        println(i)
    }
    
    println("\nFor con listas:")
    val nombres = listOf("Juan", "Maria", "Jose")
    for (nombre in nombres) {
        println(nombre)
    }

    println("\nFor con listas index valor:")
    for ((index, valor) in nombres.withIndex()) {
        println("$index -> $valor")
    }
    
    println("\nFor con break:")
    for (i in 1..10) {
        if (i == 5) break
        println(i)
    }
    
    println("\nFor con continue:")
    for (i in 1..10) {
        if (i == 3) continue
        println("item $i")
    }
    
    println("\nFor con continue y break:")
    for (i in 1..10) {
        if (i == 3) continue
        if (i == 7) break
        println("item $i")
    }
    
    println("\nAnalisis de Pacientes:")
    val pacientes = listOf(
        Triple("Garcia, M", 37.2, 98),
        Triple("Zambrano, L", 39.2, 94),
        Triple("Torres, R", 40.3, 91)
    )

    for ((posicion, datos) in pacientes.withIndex()) {
        val (nombre, temperatura, spo2) = datos
        val alertaTemp = if (temperatura >= 38.0) "Fiebre" else "Normal"
        val alertaSpo2 = if (spo2 < 95.0) "Baja" else "Normal"
        
        println("Cama $posicion - $nombre - Temp: $temperatura°C $alertaTemp - SpO2: $spo2% $alertaSpo2")
    }
}