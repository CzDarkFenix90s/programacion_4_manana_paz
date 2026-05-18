// El usuario de esta clase solo sabe QUÉ puede hacer con un Alimento
// No necesita saber cómo se calcula proteinas ni cómo funciona esApto
class Alimento(
    val id: Int,
    val nombre: String,
    val calorias: Double,
    private val alergenos: List<String> // privado — el usuario no manipula alergenos directamente
) {
    val proteinas: Double // interfaz pública — qué puede consultar
        get() = calorias / 10 // approximate

    val esApto: Boolean
        get() = alergenos.isEmpty()

    override fun toString() = "$nombre (${calorias} kcal)"
}

fun main() {
    val manzana = Alimento(1, "Manzana", 95.0, listOf())

    // El código externo usa la interfaz pública — no sabe el detalle interno
    println(manzana.esApto) // true
    println(manzana.proteinas) // 9.5
    // manzana.alergenos = listOf("mani") // ERROR — privado, protegido por diseño
}