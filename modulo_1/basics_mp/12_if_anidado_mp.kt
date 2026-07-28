fun main() {
    println("Controles de Flujo")
    println(" if Anidado")
    println("Tiene dieta previa?")
    val tieneAntecedentes = readLine()?.trim()?.lowercase() == "s"
    
    println("Calorias consumidas")
    val frecuencia = readLine()?.toIntOrNull() ?: 0

    if (tieneAntecedentes) {
        println("Paciente con dieta previa")
        if (frecuencia < 1500) {
            println("Consumo muy bajo")
        } else if (frecuencia > 3000) {
            println("Consumo excesivo")
        } else {
            println("Consumo adecuado")
        }
    } else {
        println("Paciente sin dieta previa")
        if (frecuencia < 1500 || frecuencia > 3000) {
            println("Consumo fuera del rango recomendado")
        } else {
            println("Consumo normal")
        }
    }
}