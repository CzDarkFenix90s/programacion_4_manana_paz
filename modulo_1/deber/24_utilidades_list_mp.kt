fun main() {
    println("Utilidades List")
    println("map")
    val caloriasAlimentos = listOf(95, 165, 130, 61, 200, 300, 50, 180, 250, 90)
    println(caloriasAlimentos)
    val proteinas = caloriasAlimentos.map { it / 10 } // approximate protein
    println(proteinas)
    val alimentosTexto = caloriasAlimentos.map { "Cal $it" }
    println(alimentosTexto)

    println("filter")
    val bajasCalorias = caloriasAlimentos.filter { it < 100 }
    println(bajasCalorias)
    val altasCalorias = caloriasAlimentos.filter { it > 150 }
    println(altasCalorias)
    val moderadas = caloriasAlimentos.filter { it in 100..200 }
    println(moderadas)
    val noBajas = caloriasAlimentos.filterNot { it < 100 }
    println(noBajas)

    val mezcla = listOf(95, "Manzana", 165, "Pollo", true, 130)
    val soloStrings = mezcla.filterIsInstance<String>()
    println(soloStrings)

    println("reduce")
    val caloriasReduce = listOf(95, 165, 130, 61, 200)
    val totalCalorias = caloriasReduce.reduce { acc, n -> acc + n }
    println(totalCalorias)
    val promedioCalorias = caloriasReduce.reduce { acc, n -> acc + n } / caloriasReduce.size
    println(promedioCalorias)
    println("fold")
    val totalFold = caloriasReduce.fold(1000) { acc, n -> acc + n }
    println(totalFold)
    val productoFold = caloriasReduce.fold(1) { acc, n -> acc * n / 100 } // scaled
    println(productoFold)

    println("Ordenacion")
    println("Ascendente : ${caloriasAlimentos.sorted()}")
    println("Descendente : ${caloriasAlimentos.sortedDescending()}")
    println("Sorter by : ${caloriasAlimentos.sortedBy { -it }}")
    println("Agregacion")
    println("Sumar    : ${caloriasAlimentos.sum()}")
    println("Promedio : ${caloriasAlimentos.average()}")
    println("Minimo   : ${caloriasAlimentos.minOrNull()}")
    println("Maximo   : ${caloriasAlimentos.maxOrNull()}")
    println("Contar   : ${caloriasAlimentos.count { it > 150 }}")
    println("Busqueda")
    println("Buscar        : ${caloriasAlimentos.find { it > 150 }}")
    println("Buscar ultimo : ${caloriasAlimentos.findLast { it > 150 }}")
    println("Buscar any    : ${caloriasAlimentos.any { it > 150 }}")
    println("Buscar all    : ${caloriasAlimentos.all { it > 150 }}")
    println("Buscar none : ${caloriasAlimentos.none { it > 300 }}")
    println("Buscar none : ${caloriasAlimentos.none { it > 300 }}")
}