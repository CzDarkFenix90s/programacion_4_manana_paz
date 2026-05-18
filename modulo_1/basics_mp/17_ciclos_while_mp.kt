fun main() {
    println("Controles de Flujo Iteraciones, Ciclos repetitivos - Ciclo While")
    println("While Básico - Contador de días de dieta")
    var dia = 1
    while (dia <= 5) {
        println("Día $dia de dieta")
        dia++
    }

    println("Do While - Registro de comidas")
    var comida = 1
    do {
        println("Comida $comida registrada")
        comida++
    } while (comida <= 5)

    println("Break continue - Saltar días de descanso")
    var diaDieta = 1
    while (diaDieta <= 10) {
        diaDieta++
        if (diaDieta == 3) continue
        if (diaDieta == 7) break
        println("Día $diaDieta activo")
    }

    var entrada: String
    while (true) {
        println("Ingresa 'terminar' para finalizar el registro de dieta:")
        entrada = readLine() ?: ""
        if (entrada == "terminar") break
        println("Registrado: $entrada")
    }
}