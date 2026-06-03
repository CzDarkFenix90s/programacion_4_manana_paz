fun main() {
    println("Map Inmutable")
    val baseNutricional = mapOf(
        "Manzana" to 95,
        "Pollo" to 165,
        "Arroz" to 130,
        "Leche" to 61
    )

    println(baseNutricional["Manzana"])
    println(baseNutricional["Platano"])
    println(baseNutricional.getOrDefault("Manzana", 0))
    println(baseNutricional.getOrDefault("Platano", 0))
    println(baseNutricional)
    println(baseNutricional.keys)
    println(baseNutricional.values)
    println(baseNutricional.entries)
    for ((alimento, calorias) in baseNutricional) {
        println("$alimento - $calorias kcal")
    }

    println("Map Mutable")
    val despensa = mutableMapOf(
        "Manzanas" to 10,
        "Pollos" to 4,
        "Arroz" to 12,
        "Leche" to 8
    )
    despensa["Naranjas"] = 5
    println(despensa)
    despensa["Manzanas"] = 20
    println(despensa)
    despensa.remove("Leche")
    println(despensa)
    despensa.getOrPut("Huevos") { 15 }
    println(despensa)
    despensa.getOrPut("Arroz") { 15 }
    println(despensa)
}