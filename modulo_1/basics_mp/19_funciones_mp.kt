// Online Kotlin compiler to run Kotlin program online
// Print "Try programiz.pro" message

fun main() {
    println("Funciones")
    val recomendacion = recomendarDieta()
    println(recomendacion)
    val calorias = calcularCalorias(5, 4)
    println(calorias)
    println(calcularProteinaTipoExpresion(5, 3))
    println(calcularProteinaTipoInferido(5, 3))
    recomendarDieta("Ana")
}

fun recomendarDieta(): String {
    return "Dieta balanceada recomendada"
}

fun calcularCalorias(a: Int, b: Int): Int {
    return a + b
}

//tipo expresion
fun calcularProteinaTipoExpresion(a: Int, b: Int): Int = a - b
fun calcularProteinaTipoInferido(a: Int, b: Int) = a - b

fun recomendarDieta(nombre: String) {
    println("Hola $nombre, tu dieta es baja en carbohidratos")
}