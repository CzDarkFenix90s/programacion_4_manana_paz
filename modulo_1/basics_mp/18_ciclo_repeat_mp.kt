fun main() {
    println("Controles de Flujo Iteraciones, Ciclos repetitivos - Ciclo For")
    println("For con rango - Multiplicadores nutricionales")
    for (i in 1..10) {
        println("Proteina x $i = ${1.2 * i}g") // Se quito el acento
    }

    println("For con until")
    for (i in 1 until 5) {
        println(i)
    }

    println("For con pasos - Calorias por porcion") // Se quitaron acentos
    for (i in 100..500 step 100) {
        println("Porcion $i kcal")
    }

    println("For descendente - Reduccion de calorias") // Se quitaron acentos
    for (i in 10 downTo 1) {
        println("$i kcal menos")
    }

    println("For con listas - Alimentos permitidos")
    val alimentos = listOf("Manzana", "Pollo", "Arroz", "Leche")
    for (alimento in alimentos) {
        println(alimento)
    }

    println("For con listas index valor - Menu diario") // Se quito el acento
    for ((index, alimento) in alimentos.withIndex()) {
        println("$index -> $alimento")
    }

    println("For con break - Detener al encontrar alergeno")
    for (i in 1..10) {
        if (i == 5) {
            break
        }
        println("Alimento $i")
    }

    println("For con continue - Saltar comidas no permitidas")
    for (i in 1..10) {
        if (i == 3) {
            continue
        }
        println("Comida: $i")
    }

    println("For con continue y break")
    for (i in 1..10) {
        if (i == 3) continue
        if (i == 7) break
        println("item $i")
    }

    val alimentosNutricion = listOf(
        Triple("Pollo", 165.0, 31.0),
        Triple("Arroz", 130.0, 2.7),
        Triple("Manzana", 95.0, 0.5) // CORREGIDO: Se elimino la coma final (trailing comma)
    )
    for ((posicion, alimento) in alimentosNutricion.withIndex()) {
        val (nombre, calorias, proteinas) = alimento
        val categoriaCalorias = if (calorias > 150.0) "Alta" else "Baja"
        val categoriaProteinas = if (proteinas > 20.0) "Alta" else "Baja"
        println("Alimento $posicion - $nombre - Cal: $calorias kcal $categoriaCalorias - Prot: $proteinas g $categoriaProteinas")
    }
}